---
# IMPORTANT: 
# ensure you have at least one space after the colon (:) when you provide value(s) for a metadata below
# remove the comment prefix (#) from the optional metadata name when you add a non empty value to it.

# required metadata

title: Article Title | Service Name
description:
keywords:
author:
manager:
ms.date: 04/28/2016
ms.topic: article
ms.prod:
ms.service:
ms.technology:
ms.assetid:

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer:
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Markdown Template

## Metadata 

The full metadata block is above, divided into required fields and optional fields; see the [OPS metadata cheatsheet](https://ppe.msdn.microsoft.com/en-us/ce-csi-docs/ops/ops-onboarding/managing-content/content-meta-data) for more details. Some key notes:

- You *must* have a space between the colon (:) and the value for a metadata element.
- If an optional metadata element does not have a value, comment out the element with a # (do not leave it blank or use "na")
- Colons in a value (e.g., a title) break the metadata parser. Instead use the HTML encoding of &#58; (e.g., "title: Azure Rights Management&#58; the basics | Azure RMS")
- *title*: The title should end with a pipe (|) followed by the name of the service (e.g. see above). The title need not (and probably should not) be identical to the title in your H1 heading.
- *author*, *manager*, *reviewer*: The author field should contain the *Github username* of the author, not their alias.  The "manager" and "reviewer" fields, on the other hand, should contain aliases. Reviewer should be the name of the PM associated with the article.
- *ms.assetid*: This is a GUID. For now you can get a GUID from [https://www.guidgenerator.com](https://www.guidgenerator.com). 
- *ms.prod*, *ms.servic*, *ms.technology*, *ms.devlang*, *ms.topic*, *ms.tgt_pltfrm*: Possible values for these elements can be found [here](https://microsoft.sharepoint.com/teams/STBCSI/Insights/_layouts/15/WopiFrame.aspx?sourcedoc=%7b7A321BF1-0611-4184-84DA-A0E964C435FA%7d&file=WEDCS_MasterList_CSIValues.xlsx&action=default)

## Markdown

This docs.ms markdown template contains examples of markdown syntax, as well as guidance on setting the metadata.

- [Baseline markdown syntax](https://daringfireball.net/projects/markdown/syntax)
- [Github-flavored markdown (GFM) documentation](https://guides.github.com/features/mastering-markdown)

Here are some examples of markdown syntax:

### Headings

Examples of first-, second-, and third-level headings are above.

#### Fourth level heading
##### Fifth level heading
###### Sixth level heading

### Text styling

*Bold*  

**italics** 

# Links

[link to markdown file in same repo](./understand-explore/what-is-azure-rights-management.md)
[link to external website](https://azure.microsoft.com)

### Lists

#### Ordered lists

1. This 
1. Is
1. An
1. Ordered
1. List  


1. Here
1. comes
1. an
1. embedded
    1. Miss Scarlett
    2. Professor Plum
1. ordered
1. list


#### Unordered Lists

- This
- is
- a
- bulleted
- list


- This 
- bulleted 
- list
    - Mrs. Peacock
    - Mr. Green
- contains  
- other
    1. Colonel Mustard
    1. Mrs. White
- lists



### Horizontal rule
---

### Table

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| col 1 is | t      |    $1 |

### Code

#### Codeblock

    function fancyAlert(arg) {
      if(arg) {
        $.docs({div:'#foo'})
      }
    }

#### In-line code

This is an example of `in-line code`.

### Blockquote

> The drought had lasted now for ten million years, and the reign of the terrible lizards had long since ended. Here on the Equator, in the continent which would one day be known as Africa, the battle for existence had reached a new climax of ferocity, and the victor was not yet in sight. In this barren and desiccated land, only the small or the swift or the fierce could flourish, or even hope to survive.

### Images

#### Static Image
![this is the alt text](./media/AzRMS_elements.png)

#### Linked Image

[![alt text for linked image](./media/AzRMS_elements.png)](https://azure.microsoft.com) 

#### Animated gif
![animated gif](./media/hololens.gif)

### Alerts

#### Notes

> [!NOTE]
> This is NOTE

#### Warnings

> [!WARNING]
> This is WARNING

#### Tips

> [!TIP]
> This is TIP

#### Important

> [!IMPORTANT]
> This is IMPORTANT

### Videos

#### Channel 9

<iframe src="http://channel9.msdn.com/Series/Azure-Active-Directory-Videos-Demos/Azure-Active-Directory-Connect-Express-Settings/player" width="960" height="540" allowFullScreen frameBorder="0"></iframe><br><br>

#### Youtube

<iframe width="420" height="315" src="https://www.youtube.com/embed/R6_eWWfNB54" frameborder="0" allowfullscreen></iframe>

### docs.ms extentions

#### Button

> [!div class="button"]
[button links](/rights-management)

#### Selector

> [!div class="op_single_selector"]
- [foo](/rights-management/template.md)
- [bar](/rights-management/scratch.md)

### Step-By-Step

>[!div class="step-by-step"]
[Pre](https://www.example.com)
[Next](https://www.example.com)
