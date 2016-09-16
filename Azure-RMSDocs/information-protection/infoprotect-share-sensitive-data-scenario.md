---
# required metadata

title: Share sensitive data internally and externally | Azure Information Protection
description: A scenario that describes how Enterprise Mobility + Security can be used to securely enable users to share sensitive data internally and externally by leveraging Microsoft Azure Information Protection capabilities.
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

# Share sensitive data internally and externally 

While many data breaches are due to cyberattacks, experts agree that many more are the result of human error, otherwise known as “oops” moments that happen when employees inadvertently leak sensitive business data. With the right security information and data loss prevention protocols in place, nearly all of these kinds of breaches are avoidable.

For businesses and users, data sharing is inevitable and while this is necessary, it also creates one of the biggest challenges in the industry, which is: how to enable data sharing across different devices while reducing leakage of data shared with others? The threat landscape is even broader when you need to share sensitive data with external sources, like partners, customers and other parties.

![Share Sensitive data Scenario Diagram](../media/infoprotect-share-sensitive-data-scenario-fig1.png)

In this context, it is a common scenario for enterprises to have projects where they need to enable employees to collaborate internally across data silos and externally with third-party vendors. At the same time, companies must align security protocols to the business and influence end-user behavior in data classification and protection processes.

## How can Enterprise Mobility + Security help you?
 
Enterprise Mobility + Security (EMS) is the only comprehensive cloud solution that natively protects corporate data on the device itself and beyond with four layers of protection across identities, devices, apps, and data. EMS helps you solve one of the key challenges in the mobile-first, cloud-first world – how to deliver secure email and documents to employees on-the-go. With EMS, you will enable your employees to collaborate securely within and outside of your organization. EMS allows IT Administrators to leverage Azure Rights Management policy templates to email usage. Usage rights are attached to the message itself so that protection occurs online and offline as well as inside and outside of the organization’s firewall.

## Recommended solution

By integrating Azure Rights Management with Rights Management in Exchange Online, EMS allows organizations to protect data that leaves the organization via email. You can implement this solution for Exchange Servers located on-premises and for Exchange Online (Office 365). Both Information Rights Management and Office 365 Message Encryption are policy based and designed to work with the Exchange transport rule engine. That means Microsoft Azure Rights Management lets you set up complex policy restrictions easily, with just a single action.

Some of the capabilities available with this solution are described below:

- Help protect emails against unauthorized access by applying different IRM options to your email messages.
- Help keep your information safe, online or offline, because your files are protected whether they’re viewed using Office Online or downloaded to a local machine.
- Seamlessly integrate with all Office documents to help guard your organization’s intellectual property.
- Apply custom templates based on your business needs in addition to using default Rights Management Services templates.

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