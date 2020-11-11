---
title: Quickstart - View Azure Information Protection (AIP) in the Azure portal
description: If your organization is brand-new to Azure Information Protection (AIP), start here to add the service to the Azure portal, confirm the protection service is activated, and publish labels and policy settings.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 07/19/2020
ms.topic: quickstart
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: demizets
ms.subservice: aiplabels
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
#Customer intent: As an administrator, I want to see Azure Information Protection in the Azure portal so that I can use the service.
---

# Quickstart: Get started with Azure Information Protection in the Azure portal

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

In this quickstart, you'll add Azure Information Protection to the Azure portal, confirm the protection service is activated, create default labels if you don't already have labels, and view the policy settings for the Azure Information Protection client (classic).

**Time required:** You can finish this quickstart in less than 10 minutes.

## Prerequisites

To complete this quickstart, you need:

- Access to your [**Azure portal**](https://portal.azure.com/) account.

- A subscription that includes [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection/).

    If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.

For a full list of prerequisites to use Azure Information Protection, see [Requirements for Azure Information Protection](requirements.md).

## Add Azure Information Protection to the Azure portal

Even if you have a subscription that includes [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection/), AIP is not automatically available in the Azure portal.

Perform the following steps to add AIP to the Azure portal:

1. Sign in to the [Azure portal](https://portal.azure.com) by using the global admin account for your tenant.

    If you are not the global admin, use the following link for alternative roles: [Signing in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal)

1. Select **+ Create a resource**. From the search box for the Marketplace, type and then select **Azure Information Protection**. On the Azure Information Protection page, select **Create**, and then **Create** again.

    :::image type="content" source="media/gifs/quickstart-add-aip-to-portal.gif" alt-text="Add Azure Information Protection to your Azure portal":::

    > [!TIP]
    > If this is the first time you're performing this step, you'll see a **Pin to dashboard** ![Pin to dashboard icon](media/qs-tutor/pin-to-dashboard.png "Pin to dashboard icon") icon next to the pane name. Select to create a tile on your dashboard so that you can navigate directly here next time.

## Confirm that the protection service is activated

The protection service is now automatically activated for new customers. Confirm that it's activated now or later, as follows:

1. On the **Azure Information Protection** pane, select **Manage** > **Protection activation**.

1. Confirm whether protection is activated for your tenant. For example:

    :::image type="content" source="media/qs-tutor/confirm-activation.PNG" alt-text="Confirm AIP activation":::

    If protection is not activated at any point, any you need to activate it, select **Activate** ![Activate AIP](media/qs-tutor/activate.png "Activate AIP"). When activation is complete, the information bar displays **Activation finished successfully**.

## Create and publish labels

Your organization might already have labels because they were automatically created for your tenant, or because you have sensitivity labels in the Office 365 Security & Compliance center, the Microsoft security center, or the Microsoft compliance center. Let's take a look:

1. Under **Classifications**, select **Labels**.

    You might already have default labels created. The following image shows the labels that are created by default with Azure Information Protection:

    :::image type="content" source="media/info-protect-defaultlabels.png" alt-text="Azure Information Protection default labels":::

    **If you don't see the default labels, or any labels**:

    If you don't see the default labels, or any labels, select **Generate default labels** to create them for use in the classic client.

    If you don't see the **Generate default labels** button above the grid, under **Manage**, select **Unified labeling.** If the Unified labeling status is **Not activated**, select **Activate**, and then return to the **Classification** > **Labels** pane.

    > [!NOTE]
    > For the unified labeling client, labels are managed in Microsoft M365. For more information, see [Restrict access to content by using encryption in sensitivity labels](/microsoft-365/compliance/encryption-sensitivity-labels).
    >

1. Publish your labels in the Azure portal to make them available for the Azure Information Protection classic client:

    1. Open the **Global** policy. Under **Classifications**, select **Policies** > **Global**.

    1. Select **Add or remove labels**.

    1. From the **Policy: Add or remove labels** pane, select all the labels, and then select **OK**.

    1. Back on the **Policy: Global pane**, select the **Save** ![Save](media/qs-tutor/save-icon.png "Save")  button.

        At the prompt, click **OK** to publish your changes.

## View your labels

Now you can familiarize yourself with your labels.

If you still have the **Global** policy open, click the **X** at the top-right to close the pane. Under **Classifications**, select **Labels**.

The default Azure Information Protection classification labels are:

- **Personal**
- **General**
- **Confidential**
- **Highly Confidential**

By default, some labels already have visual markings configured. These visual markings might be a footer, header, and/or watermark. Other labels also have protection configured.

Select a label and browse around to see the detailed configuration for that label.

> [!TIP]
> Expand the **Highly Confidential** label to see an example of how a classification can have subcategories.
>

## View your policy settings

The first time you connect to the Azure Information Protection service from the Azure portal, default policy settings used by the Azure Information Protection client are always created for you.

- **Classic client.** For the classic client, both labels and policy settings are downloaded to the client in the Azure Information Protection policy.

- **Unified labeling client.** For the unified labeling client, only labels are downloaded to the client. Policy settings are downloaded from the Office 365 Compliance & Security Center, the Microsoft 365 Compliance center, or the Microsoft 365 Security center. Use those admin centers to edit your labels and label policies instead of the Azure portal.

    For more information, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) in the Microsoft 365 documentation for more information.

**Classic client instructions:**

To view the default Azure Information Protection policy settings for the classic client:

1. Under **Classifications**, select **Policies** > **Global** to display the default Azure Information Protection policy settings that are created for your tenant.

1. The policy settings are displayed after the labels, in the **Configure settings to display and apply on Information Protection end users** section. For example, there is no default label set, documents and emails are not required to have a label, and users do not have to provide justification when they change labels:

    :::image type="content" source="media/defaultsettings-aip.png" alt-text="Azure Information Protection policy global settings":::

1. You can now close any panes in the portal that you have opened.

## Next steps

Your next steps will differ, depending on whether you have the classic or unified labeling client. Not sure of the difference between these clients? See this [FAQ](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).

**If you are using the classic client:**

- You might find the following tutorial helpful as your next step: [Edit the policy and create a new label for Azure Information Protection](infoprotect-quick-start-tutorial.md).

- Alternatively, for detailed instructions for configuring all aspects of the Azure Information Protection policy, see [Configuring the Azure Information Protection policy](configure-policy.md).

**If you are using the unified labeling client:**

See [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from the Microsoft 365 Compliance documentation.