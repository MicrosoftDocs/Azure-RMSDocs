---
# required metadata

title: How to deploy an app - AIP
description: This article describes the process of peploying your service application into a different tenant than the one it was originally developed with.
keywords:
author: kkanakas
ms.author: kartikk
manager: mbaldwin
ms.date: 02/27/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 34dc6d6f-cfe4-4848-9b11-8d90c4b38ef7
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: kartikk
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Deploying your Service Application into a different tenant

This article describes the process of peploying your service application into a different tenant than the one it was originally developed with.

> [!Note]
> This scenario is only relevant if your service application uses symmetric key authentication.

## Scenario
Company *CoolApp* has developed a service application using Azure Information Protection (AIP) that encrypts, labels, and protects documents when users are exporting documents from a business application such as Dynamics, SAP, or Salesforce. For this scenario, large enterprise *ABC* buys  *CoolApp's* new application so, the *CoolApp* team needs to deploy their solution into *ABC’s* environment. 

![Sample flow for creating symetric key in a different tenant](../media/develop/service-app-provision.jpg)

## Flow 1: *CoolApp* provides a UI dialog to *ABC* to implement the deployment

Once the large company *ABC* purchases *CoolApp's* solution, the IT administrator at *ABC* must create the *CoolApp* service principal and register the application *ABC's* tenant. 

The steps for this are outlined in [Developing you application](developing-your-application.md), in the section, **Create a service Principal**.

![Form example for the IT Administrator to input for your application](../media/develop/how-to-deploy-app-UI.png)

> [!Note]
> To create Service Principal in a tenant you need tenant admin rights

The IT administrator then launches the *CoolApp* application as service their environment and embeds the details for the *CoolApp* application to work such as application ID, tenant ID, and the symmetric key.

## Flow 2: *ABC* IT Administrator provides the key to the CoolApp team

Once *ABC's* IT Administrator creates the service principal as shown in Figure 1, the *ABC* provides the information to the *CoolApp* team. The *CoolApp* team then proceeds to embed the information in to the *CoolApp* application for use in the *ABC's* tenant.

In both cases the authentication is done using the symmetric key. If the desired experience is to not provide the IT administrator of *ABC* with a UI prompt for the service principal information, then **Flow 2** is the method to follow. Sharing the symmetric key from *ABC’s* tenant does not give the *CoolApp* product administrative rights in the *ABC’s* tenant environment.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]