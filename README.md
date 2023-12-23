# Contacts
CRUD operations (Angular, .Net Core 6 WebAPI, SQLExpress)

A-SQL proj:
---------
1)Add sql project in visual studio;
2)Add proj variables;
3)Select db server;
4)Publish sql proj (to get DACPAC).

B-Angular proj:
---------------
Install Node.js:
---------------
https://nodejs.org/en/download
64-bit or ARM64(mostly for Mobile devices)

Check the Node.js version:
--------------------------
C:\Users\user>node -v

Check the npm version:
--------------------------
C:\Users\user>npm -v
npm - is a package manager for the JavaScript programming language.
This is the default package manager for the Node.js runtime.
Includes a command line client, also called npm, and an online public database
and private packages, which is called the npm registry.
Programming language: JavaScript


Install Angular CLI (open Node.js command promt!!!):
-------------------------------------------------------
C:\Users\user>npm install -g @angular/cli

Check the Angular version:
-------------------------
C:\Users\user>ng version

Create new proj:
----------------
C:\Users\user\Downloads\GitHubProjects\Contacts>ng new Contacts.UI --no-standalone
? Which stylesheet format would you like to use? CSS
? Do you want to enable Server-Side Rendering (SSR) and Static Site Generation (SSG/Prerendering)? Yes

Open proj using VSCode:
-----------------------
C:\Users\user\Downloads\GitHubProjects\Contacts>cd Contacts.UI

C:\Users\user\Downloads\GitHubProjects\Contacts\Contacts.UI>code .

Simple run project:
-------------------
C:\Users\user\Downloads\GitHubProjects\Contacts\Contacts.UI>ng serve --o

Generate component dialog window:
---------------------------------
C:\Users\user\Downloads\GitHubProjects\Contacts\Contacts.UI>ng generate component contact-dialog

Add material:
------------
C:\Users\user\Downloads\GitHubProjects\Contacts\Contacts.UI>ng add @angular/material
i Using package manager: npm
√ Found compatible package version: @angular/material@17.0.4.
√ Package information loaded.

The package @angular/material@17.0.4 will be installed and executed.
Would you like to proceed? Yes
√ Packages successfully installed.
? Choose a prebuilt theme name, or "custom" for a custom theme: Custom
? Set up global Angular Material typography styles? No
? Include the Angular animations module? Include and enable animations

Add interfaces:
---------------
C:\Users\user\Downloads\GitHubProjects\Contacts\Contacts.UI\src\app\interfaces>ng generate interface contact
CREATE src/app/interfaces/contact.ts (29 bytes)
