---
# required metadata

title: Secure data using classification, labeling and protection with Azure Information Protection | Azure Information Protection
description: A scenario that describes how Enterprise Mobility + Security can be used to classify, label and protect data by leveraging Microsoft Azure Information Protection capabilities.
author: yuridio
manager: swadhwa
ms.date: 09/15/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: v-craic
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Secure data using classification, labeling and protection with Azure Information Protection 

Nowadays information sharing is taking place from multiple devices and across organizational boundaries.  It becomes imperative to ensure that critical corporate data is not compromised in this process while enabling users to securely share what’s important for them to perform their jobs. With trends such as outsourcing, you may need to share company confidential data with contractors and vendors. Because not all content needs the same protection, companies are challenged to identify which data needs protection and which data does not.

Continue reading to learn more about how Enterprise Mobility + Security helps address this scenario.

## How can Enterprise Mobility + Security help you?
 
Enterprise Mobility + Security (EMS) is the only comprehensive cloud solution that protects corporate data on the device itself and beyond with four layers of protection across identities, devices, apps, and data. EMS helps you solve one of the key challenges in the mobile-first, cloud-first world – how to deliver secure data to employees on-the-go. With EMS, you will enable your employees to collaborate securely within and outside of your organization. EMS allows IT Administrators to leverage Azure Information Protection to help securing corporate data at the file level. By using this capability, they can rest assured the data is always protected–regardless of where it’s stored, with whom it’s shared, and whether it’s at rest or in transit. 

## Recommended solution

Azure Information Protection lets organizations classify, label, and protect data at the time of creation or modification. With Azure Information Protection, users can:

- Classify data based on sensitivity, and add labels—manually or automatically
- Protect data using encryption, authentication and use rights
- Enable intuitive, non-intrusive experience for end users

The organization also has access to detailed tracking and reporting so they can see what’s happening with the shared data to manage it better. The following diagram summarizes the information protection lifecycle:

![Information protection lifecycle](../media/infoprotect-secure-classify-scenario-fig1.png)

Watch this short video for a quick introduction on how Azure Information Protection makes it simpler to classify, label and protect information, even as it travels outside of your organization.

Watch this short video for a quick introduction on how Azure Information Protection makes it simpler to classify, label and protect information, even as it travels outside of your organization.



## How to implement this solution

To configure Exchange  to support Azure RMS, you must configure the information rights management (IRM) service for Exchange. Follow these steps to implement this solution:

1. Integration with Exchange:
	- Exchange Online: [Enable Exchange Online to use Azure RMS](../deploy-use/configure-office365.md#exchange-online-irm-configuration)
	- Exchange On-premises: [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md)
2. Install RMS sharing application
3. Send a Protected Office Document Using Exchange


## How to share sensitive data internally and externally

Companies need to enable employees to collaborate internally across data silos and externally with third-party vendors. At the same time, companies must align security protocols to the business and influence end-user behavior and protection processes. Data share becomes a critical part of the process that organizations need to enable while reducing the likelihood that data is lost or compromised.

### Step 1: Integration with Exchange

Rights Management protection is applied to email by assigning  an Azure Rights Management policy template to an email message. The first step to enable this integration to take place will vary according to where your Exchange is located: in the cloud (Exchange Online) or on-premises. 

#### Enable Rights Management Integration with Exchange Online

To configure Exchange Online to support Azure RMS, you must configure the information rights management (IRM) service for Exchange Online. In the article [Office 365: Configuration for clients and online services](../deploy-use/configure-office365.md), follow the steps from the section [Exchange Online: IRM Configuration to configure Exchange Online for IRM](../deploy-use/configure-office365.md#exchange-online-irm-configuration#exchange-online-irm-configuration).

The last step should be the final test to validate the configuration and you should see a result similar to the one shown in the following screen:

![PowerShell result](../media/infoprotect-share-sensitive-data-scenario-fig2.png)

#### Enable Rights Management Integration with Exchange On-Premises

To configure rights management integration with Exchange on-premises, you must configure the Microsoft Rights Management (RMS) connector. This connector will enable existing on-premises Exchange servers to use their Information Rights Management (IRM) functionality with the cloud-based Microsoft Rights Management service (Azure RMS). You can use this connector even if some of your users are connecting to online services, in a hybrid scenario.

Review the [prerequisites to install RMS Connector](../deploy-use/deploy-rms-connector.md#prerequisites-for-the-rms-connector) and follow the five steps available in the article [Installing and configuring the Azure Rights Management connector](../deploy-use/install-configure-rms-connector.md).

### Step 2: Install RMS sharing application

A key scenario of the Azure RMS is the ability to share rights-protected documents to other users–both internal to the organization and external–via email. The Microsoft RMS sharing application for Windows is an add-in on the Microsoft Office application’s Home ribbon, as shown in the following screen:

![RMS Sharing in Office](../media/infoprotect-share-sensitive-data-scenario-fig3.png)

If you already see this on your PC, you don’t need to download the app. If you do not see it and you need to install this application with user interaction, follow the steps from [Download and install the Rights Management sharing application](../rms-client/install-sharing-app.md). If you need to automate your installation, use the steps from [Automatic deployment for the Microsoft Rights Management sharing application](../rms-client/sharing-app-admin-guide.md#automatic-deployment-for-the-microsoft-rights-management-sharing-application).

Microsoft Azure Information Protection is an add-in on the Microsoft Office applications’ Home Ribbon, as shown in the following screen: 

![Azure Information Protection add-in in Office](../media/infoprotect-share-sensitive-data-scenario-fig4.png)

If you already see this on your PC, you don’t need to download the app. If you don’t see it, use the steps from [Installing the Azure Information Protection client](../rms-client/info-protect-client.md).

### Step 3: Send a Protected Document Using Exchange

If you need to support different types of clients, review the article [Rights Management sharing application: Installation and configuration for clients](../deploy-use/configure-sharing-app.md) for more details on how to install RMS Sharing application. If you want to share an Office document, for example directly from Word, you can simply use the **Share Protected** icon in the ribbon as shown in the following image:

![Share protected icon](../media/infoprotect-share-sensitive-data-scenario-fig5.png)

After you click on this option, you should see the share protected dialog with more details about how you want to share this document, as shown in the following image:

![Share document window](../media/infoprotect-share-sensitive-data-scenario-fig6.png)

On top of this window you must type the target user’s email, and select the type of access that you want to provide for this user. In the bottom of this window, you can also control the document’s expiration date and enable the option to receive an email every time someone tries to open this document. After finishing making the proper selections, click Send and Outlook will open with a new message as shown in the following screen:

![Outlook](../media/infoprotect-share-sensitive-data-scenario-fig7.png)