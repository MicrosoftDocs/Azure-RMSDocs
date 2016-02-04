---
title: Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 965581c8-be3c-43b4-8145-5cefd29c7636
author: Cabailey
---
# Azure Rights Management
<?xml version="1.0" encoding="utf-8"?>
<developerConceptualDocument xmlns="http://ddue.schemas.microsoft.com/authoring/2003/5" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ddue.schemas.microsoft.com/authoring/2003/5 http://dduestorage.blob.core.windows.net/ddueschema/developer.xsd">
  <introduction>
    <para>This page introduces the technical documentation set for Microsoft <token>aad_rightsmanagement_1</token> (Azure RMS), to help you protect your organization’s sensitive information from unauthorized access, and control how this information is used.  <token>aad_rightsmanagement_1</token> is a cloud service, and is integrated into other Microsoft cloud services and applications, such as Office 365 and Azure Active Directory. However, it can also be used with your on-premises applications and services.</para>
    <para><token>aad_rightsmanagement_2</token> uses encryption, identity, and authorization policies to help secure your files and email. In comparison to standard access controls, such as NTFS permissions, protection that is applied by using <token>aad_rightsmanagement_2</token> stays with the files and emails, independently of the location—inside or outside your organization, networks, file servers, and applications. This information protection solution keeps you in control of your data, even when it is shared with other people.</para><para>For example, you can configure a file so that it can be accessed only by people in your organization, or control whether the file can be edited, or restricted to read-only, or prevent it from being printed. You can configure emails similarly, and in addition, prevent them from being forwarded or prevent the use of the Reply All option. These protection tasks can be simplified and streamlined by using standardized policy templates. </para>
    <para>
      For a deeper understanding and some examples, see <link xlink:href="aeeebcd7-6646-4405-addf-ee1cc74df5df">What is Azure Rights Management?</link></para>
    <para>Use the following information to learn more about <token>aad_rightsmanagement_1</token> and deploy it for your organization:</para>
    <list class="bullet">
      <listItem>
        <para>
          <link xlink:href="5214667c-ec69-42ca-8bbf-8cb22da8c62e">Getting started with Azure AD Rights Management</link>
        </para>
      </listItem>
      <listItem>
        <para>
          <link xlink:href="206a0bfe-0912-4e0e-aa15-484b000b264c">Configuring rights management</link>
        </para>
      </listItem>
      <listItem>
        <para>
          <link xlink:href="18564e4a-9364-4ed2-8f17-89d24fc0d878">Using rights management</link>
        </para>
      </listItem>
      <listItem>
        <para>
          <link xlink:href="a890e04a-4b70-41b5-8d5f-3c210a669faa">Administering rights management</link>
        </para>
      </listItem>
    <listItem><para><link xlink:href="83dfa88f-e50a-42d8-b529-df2161a3623e">Rapid Deployment Guide for Azure Rights Management</link></para></listItem></list>
    <para>For additional resources, see <link xlink:href="7cc73d92-27d6-49ff-a8ab-2fae73519b4b">Information and Support for Azure Rights Management</link>. </para>
  </introduction>
  <section>
<title>Also known as ...</title><content><para>Azure Rights Management is also known as <legacyItalic>Azure Rights Management service</legacyItalic>, but because it runs as a service in Azure, the "service" is often omitted from its name. It is the cloud version of <legacyItalic>Active Directory Rights Management Services</legacyItalic> (AD RMS), which was first released as <legacyItalic>Windows Rights Management Services</legacyItalic> (Windows RMS). </para><para>Because RMS is a well-known abbreviation for its predecessors, Azure Rights Management is often abbreviated to <legacyItalic>Azure RMS</legacyItalic>.</para><para>Azure Rights Management was originally named <legacyItalic>Windows Azure Active Directory Rights Management</legacyItalic> (often abbreviated to <legacyItalic>Windows Azure AD Rights Management</legacyItalic>), then  <legacyItalic>Windows Azure Rights Management</legacyItalic>, and now finally <legacyItalic>Azure Rights Management</legacyItalic>.  </para><para>You might also see references to <legacyItalic>Information Rights Management,</legacyItalic> often abbreviated to <legacyItalic>IRM</legacyItalic>. This is the Office implementation of Rights Management, which can support both Azure RMS and AD RMS.  When Azure RMS was first released, it could only be used with Office 365—for example, with an Office 365 E3 subscription. Now, Azure RMS  is extended to other subscriptions, such as the Enterprise Mobility Suite (EMS) and support now includes Office 2016, Office 2013, Office 2010, on-premises versions of SharePoint and Exchange, and Azure RMS can protect any file type. For more information, see  <link xlink:href="2cdc7bde-4044-4021-b887-11476f99afd9">How Applications Support Azure Rights Management</link>.</para><para>You might also see occasional references to <legacyItalic>Microsoft Rights Management</legacyItalic>, or <legacyItalic>Microsoft Rights Management services</legacyItalic>, which is a collective term that can include both Azure RMS and AD RMS.  The "<legacyItalic>NEW Microsoft RMS</legacyItalic>" was a popular label that was sometimes used  when Azure Rights Management was officially released, to emphasize the new ease of deployment in comparison to its on-premises predecessors. </para><alert class="tip">
 <para>You'll find these terms (and more) in <link xlink:href="742877bf-26f5-40e3-b1f7-8475e7c3ce11">Terminology for Azure Rights Management</link>.</para>
</alert><para>As an enterprise information protection solution, Microsoft Rights Management services do not provide digital rights management (DRM) solutions that typically protect against illegal distribution of digital software. </para></content>
</section><relatedTopics/>
</developerConceptualDocument>
