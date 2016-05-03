# Azure-RMSDocs-pr
Content repo for Azure RMS docs publishing to docs.ms.com through OPS
Quick intro Open Publishing   
======================================
Start contributing to this repo using the following steps:

1. Clone the repo:
   ```
   git clone <git repo name>
Example:
   git clone https://github.com/Microsoft/EMDocs-pr.git
   ```

2. Create a branch to work on locally
3. Edit the Markdown files using your favorite Markdown editor.
4. Validate and preview your content locally, to discover and fix problems early, before pushing your changes to the GitHub repo:
   * Run `git submodule update --init` to download the themes to your local machine.
   * Follow the instructions in [Local builds and preview page](https://ppe.msdn.microsoft.com/en-us/openpublishing/docs/partnerdocs/local-build-and-preview)
5. Commit and push your changes:
   ```
   git add -u
   git commit -m "update doc"
   git push
   ```
6. Create a pull request to master branch.
7. Your content will be automatically published once the pull request is accepted.
