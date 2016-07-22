---
# required metadata

title: How to configure conditions for automatic and recommended classification for Azure Information Protection | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 07/21/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: e915f959-eafb-4375-8d2c-2f312edf2d29

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to configure conditions for automatic and recommended classification for Azure Information Protection

*Applies to: Azure Information Protection preview*

When you configure conditions for a label, you can automatically assign a a label to a document or email. Or, you can prompt users to select the label that you recommend: 

- Automatic classification applies to Word, Excel, and PowerPoint when files are saved, and apply to Outlook when emails are sent. You cannot use automatic classification for files that were previously manually labeled.
 
- Recommended classification applies to Word, Excel, and PowerPoint when files are saved.

When you configure conditions, you can use predefined patterns, such as “Credit card numbers” or “USA Social Security Number”. Or, you can define a custom string or pattern as a condition for automatic classification. 

> [!TIP]
>For the best user experience and to ensure business continuity, we recommend that you start with user recommended classification, rather than automatic classification. This configuration gives your users the ability to accept the labeling or protection action, or override these suggestions if they are not suitable for their document or email message.




Use the following instructions to configure recommended or automatic classification for a label.

1. Make sure that you are signed in to the Azure portal by using this special link for Azure Information Protection: https://portal.azure.com/?microsoft_azure_informationprotection=true
 
2. On the hub menu, click **Browse** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

3. On the **Azure Information Protection** blade, select the label that you want to configure for automatic or recommended classification.

4. On the **Label** blade, in the **Configure conditions for automatically applying this label** section, click **Add a new condition**.

5. On the **Condition** blade, select **Built-in** if you want to use a predefined condition, or **Custom** if you want to specify your own, and then click **Save**:

    - For **Built-in**: Select from the list of available conditions, and then select the minimum number of occurrences. 
    
        For more information about how the detection rules for these conditions and some examples, see the [Information about the built-in conditions](#information-about-the-built-in-conditions) section.

    - For **Custom**: Specify a name and phrase to match, which must exclude quotation marks and special characters. Then specify whether to match as a regular expression, use case sensitivity, and the minimum number of occurrences.

6. On the **Label** blade, configure the following, and then click **Save**:

    - Choose automatic or recommended classification: For **Select how this label is applied: automatically or recommended to user**, select **Automatic** or **Recommended** .

    - Specify the text for the user prompt or policy tip: Keep the default text or specify your own string.

7. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Information about the built-in conditions

During the preview period, you can select the following conditions:

- [SWIFT Code](#swift-code )

- [Credit Card Number](#credit-card-number )

- [ABA Routing Number](#aba-routing-number )

- [USA Social Security Number (SSN)](#usa-social-security-number-ssn)

- [International Banking Account Number (IBAN)](#international-banking-account-number-iban)


### SWIFT Code

Match this information type when the content includes the following:  

1. One of the following phrases: **swift**, **swiftnumber**, **swiftroutingnumber** 

2. A Swift code, in a formatted pattern:  

    a. 4 letters (bank code)  

    b. 2 letters (country code)  

    c. 2 letters or digits (location code)  

    d. Optional 3 letters or digits (branch code)  


Regular expression:

`\b([a-zA-Z]){4}([a-zA-Z]){2}([0-9a-zA-Z]){2}([0-9a-zA-Z]{3})?\b`

Examples for testing:

- **NEDSZAJJXXX Swiftroutingnumber**

- **NEDSZAJJ100 Swiftnumber** 

----


### Credit Card Number

Match this information type when the content includes the following:  

- A valid credit card number, in a formatted or unformatted pattern, that  passes the [luhn check](https://wikipedia.org/wiki/Luhn_algorithm). This information type detects cards from all major brands worldwide, including Visa, MasterCard, Discover Card, American Express, and Diners.

**Formatted**:

- 16 digits: (dddd-dddd-dddd-dddd)  

**Unformatted**:

- (dddddddddddddddd)  


Examples for testing:

- **4242-4242-4242-4242**

- **4242424242424242** 

----

### ABA Routing Number

Match this information type when the content includes the following:  

1. At least one of the following phrases: **aba**, **rtn**, **routing number** 

2. An ABA routing number, which includes 9 digits that can be in a formatted or unformatted pattern: 

    **Formatted**: 

    a. Four digits that start with 0, 1, 2, 3, 6, 7, or 8 

    b. A hyphen 

    c. Four digits 

    d. A hyphen 

    e. A digit 

    Example: 3456-9876-1 ABA 

    **Unformatted**: 

    - 9 consecutive digits that start with 0, 1, 2, 3, 6, 7, or 8 

    Example: 345698761 RTN 
 
Regular expression:

`\b([0,1,2,3,6,7,8]{1})([0-9]{3})([-]?)([0-9]{4})([-]?)([0-9]{1})\b` 


Examples for testing:

- **3456-9876-1 ABA**

- **345698761 RTN** 

----

### USA Social Security Number (SSN)

Match this information type when the content includes the following:  

1. At least one of the following phrases: **ssn**, **social security**, **ssid**, **ss#** 

2. A social security number: 9 digits, which can be in a formatted or unformatted pattern:

**Formatted**: 

- Nine digits in the following format: ddd-dd-dddd OR ddd dd dddd 

**Unformatted**: 

- Nine digits in the following format: ddddddddd 

Regular expression:

`\b(?!000)([0-6]\\d{2}|7([0-6]\\d|70))([ -]?)(?!00)\\d\\d\\3(?!0000)\\d{4}\b`


Examples for testing:

- **SSN 123-45-6789**

- **SS# 123456789** 


----

### International Banking Account Number (IBAN)

Match this information type when the content includes the following:  

1. The following phrase: **IBAN** 

2. An IBAN number: Starts with a country code (two letters), then check digits (two digits), then bban number (up to 30 digits).

Regular expression: 

`\b((NO)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{3}|(NO)[0-9A-Z]{15}|(BE)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}|(BE)[0-9A-Z]{16}|(DK|FO|FI|GL|NL)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{2}|(DK|FO|FI|GL|NL)[0-9A-Z]{18}|(MK|SI)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{3}|(MK|SI)[0-9A-Z]{19}|(BA|EE|KZ|LT|LU|AT)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}|(BA|EE|KZ|LT|LU|AT)[0-9A-Z]{20}|(HR|LI|LV|CH)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{1}|(HR|LI|LV|CH)[0-9A-Z]{21}|(BG|DE|IE|ME|RS|GB)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{2}|(BG|DE|IE|ME|RS|GB)[0-9A-Z]{22}|(GI|IL)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{3}|(GI|IL)[0-9A-Z]{23}|(AD|CZ|SA|RO|SK|ES|SE|TN)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}|(AD|CZ|SA|RO|SK|ES|SE|TN)[0-9A-Z]{24}|(PT)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{1}|(PT)[0-9A-Z]{25}|(IS|TR)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{2}|(IS|TR)[0-9A-Z]{26}|(FR|GR|IT|MC|SM)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{3}|(FR|GR|IT|MC|SM)[0-9A-Z]{27}|(AL|CY|HU|LB|PL)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}|(AL|CY|HU|LB|PL)[0-9A-Z]{28}|(MU)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{2}|(MU)[0-9A-Z]{30}|(MT)[0-9A-Z]{2}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{4}[ ][0-9A-Z]{3}|(MT)[0-9A-Z]{31})\\b",`


Examples for testing:

- **GB29 NWBK 6016 1331 9268 19 IBAN**


## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section.  



