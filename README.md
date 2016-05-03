# Microsoft Enterprise Mobility - Technical Documentation Contributor Guide

You've found the GitHub repository that houses the source for the Microsoft Azure Rights Management (RMS) documentation, published to the Microsoft Enterprise Mobility (EM) Documentation Center at [https://docs.microsoft.com/en-us/enterprise-mobility/](https://docs.microsoft.com/en-us/enterprise-mobility/).

## Contribute to the Azure RMS documentation
Thank you for your interest in Enterprise Mobility documentation! See below for details on how you can contribute to our technical documentation.  

## Ways to contribute

You can contribute to [Enterprise Mobility documentation](https://docs.microsoft.com/en-us/enterprise-mobility/) in a few different ways:

* Participation in an Azure RMS [Microsoft forum](https://social.technet.microsoft.com/Forums/en-US/home?forum=rmscloud) or [Stack Overflow](http://stackoverflow.com/questions/tagged/rights-management) discussion.
* Submitting general feedback/comments at the bottom of articles, or "sidenote" comments within the article for a specific paragraph or sentence.
* Submitting a Pull Request in Github, containing your actual suggested article changes (next section) 

##Suggesting changes to Github articles

###Minor corrections

You can easily make minor contributions to technical articles directly in the GitHub user interface. Either find the article by browsing this repository, or visit the article on [https://docs.microsoft.com/en-us/enterprise-mobility/](https://docs.microsoft.com/en-us/enterprise-mobility/) and click the "Edit" link in the upper-right corner of the article. This will drop you directly into the Github page for the article source, allowing you to create make changes and submit a pull Request which contains your changes.

Minor corrections or clarifications you submit for documentation and code examples in this repository are covered by the [Microsoft Terms of Use (ToU)](https://www.microsoft.com/en-us/legal/intellectualproperty/copyright/default.aspx).

###Larger submissions

If you are making substantial changes to an existing article, adding or changing images, or contributing a new article, you need to fork this repository (via the Github user interface), install Git Bash and a Markdown editor, and learn some git commands.

If you submit a pull request with new or significant changes to documentation and code examples, we may need to correspond with you in the pull request, asking you to submit an online Contribution License Agreement (CLA).

## Repository organization

The content in the repository is loosely aligned with the organization of documentation on the corresponding [https://docs.microsoft.com/en-us/enterprise-mobility/](https://docs.microsoft.com/en-us/enterprise-mobility/) page. A series of subdirectories are used for separation of article types, along with media content (ie: image files) and include files (markdown files that are reused across multiple main articles).

### Main articles directory

The main articles directory is found directly off the root of the repository, and contains a set of subdirectories with articles formatted as markdown files with an *.md* extension. For the Azure RMS repository, this is the `\Azure-RMSDocs` subdirectory. 

Within the root of this directory are general articles that relate to the overall service, along with another series of subdirectories, which match the common scenarios as outlined on the main landing page for the service. For instance, the "Understand & Explore" articles are in the `Understand` subdirectory, "Deploy & Use" articles are found in the `DeployUse` subdirectory, etc.  

* **Article filenames:** Note that filenames use the following rules:
    * Contain only lowercase letters, numbers, and hyphens. 
    * No spaces or punctuation characters. Use the hyphens to separate words and numbers in the file name.
    * No more than 80 characters - this is a publishing system limit
    * Use action verbs that are specific, such as develop, buy, build, troubleshoot. No -ing words.
    * No small words - don't include a, and, the, in, or, etc.
    * Must be in markdown and use the .md file extension. 
* **Media subdirectory:** As mentioned, each article directory also contains a `\media` subdirectory for corresponding media files, inside which are images used by articles that have image references.  
* **Includes subdirectory:** Whenever we have reusable content that is shared across two or more articles, we place it in an `includes` subdirectory off of the main articles directory. In the markdown file that wishes to use the include file, a corresponding INCLUDE markdown extension is placed in the location where the include file needs to be referenced.  

     The format of the extension is as follows:

    `> [!INCLUDE[accessibility6](./includes/accessibility6_md.md)]`

    The statement must begin with `> [!INCLUDE`, followed immediately by a user-defined name for the include site enclosed in brackets, `[accessibility6]`, followed immediately by the relative path to the include file enclosed in parentheses, `(./includes/accessibility6_md.md)`, and terminated with the closing bracket, `]`.

### Markdown file template

For convenience, each repository contains a markdown template file named `template.md`, which can be used as a "starter file" if you need to create a new article for submission to the repository. The file contains various examples of using markdown to format an article, along with general instructions. 

At the top of the file, you'll also see a "metadata" section, which contains various tags used for tracking information relating to the article. Article metadata enables certain functionality, such as author attribution, contributor attribution, breadcrumbs, article descriptions, and SEO optimizations as well as reporting Microsoft uses to evaluate the performance of the content. So, the metadata is important! If you're unsure of the values to use for the metadata section, you can leave them blank and they will be reviewed/completed by the pull request reviewer for the repository.

## Use GitHub, and Git to contribute to this repository

If you're unfamiliar with Git, you may want to review some [basic Git terminology](https://help.github.com/articles/github-glossary). In addition, [this StackOverflow thread](http://stackoverflow.com/questions/7076164/terminology-used-by-git.) contains a glossary of Git terms you'll encounter in this set of steps.

Once you've configured your Github account, installed a client Git tool (such as [Git Bash](https://git-scm.com/downloads)), and created your own fork of the repository, you can used the following general steps to start contributing to this repo:

1.Clone the repository:  


    git clone https://github.com/Microsoft/Azure-RMSDocs.git

2.Create a branch for your local work.  
3.Edit the Markdown files using your favorite Markdown editor.  
4 Commit and push your changes back up to your forked repository:  
        
        git add -u
        git commit -m "update doc"
        git push  
          
5.Return to Github and create a pull request, requesting that your branch be pulled into the "master" branch of the related Enterprise Mobility repository.  
6. Your content will be automatically published once the pull request is accepted.  

### Branches

We recommend that you create local working branches that target a specific scope of change. Each branch should be limited to a single concept/article both to streamline work flow and reduce the possibility of merge conflicts.  The following efforts are of the appropriate scope for a new branch:

* A new article (and associated images)
* Spelling and grammar edits on an article.
* Applying a single formatting change across a large set of articles (e.g. new copyright footer).

## Resources

### Markdown
All the articles in this repository use GitHub flavored markdown. See [Markdown basics](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/) for a good reference on getting started, and the [Github Markdown Cheatsheet](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf) for a handy syntax reference. 

This is not an exhaustive list, but here are a few ideas for Markdown editors that you may wish to try:

- **Atom**: GitHub's Atom markdown editor: [http://atom.io](http://atom.io). It does not require a license for business use. It has spell check. 
- **Prose**: This is a lightweight, elegant, on-line, and open source markdown editor that offers a preview. Visit [http://prose.io](http://prose.io) and authorize Prose in your repository.
- **[Visual Studio Code](https://www.visualstudio.com/products/code-vs.aspx)** - A lightweight but powerful source code editor which runs on your desktop and is available for Windows, OS X and Linux. 
- **Notepad**: You can use Notepad for a very lightweight option.

