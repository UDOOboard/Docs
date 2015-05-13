#UDOO Docs


Welcome to UDOO's official documentation project. This docs aim to provide a comprehensive, portable and unified tool for UDOO users.

We strongly encourage members of community to review, edit and integrate such docs. 


To do so simply clone this repo, edit and send a pull request following these steps:

* Clone the Repo with 

	git clone https://github.com/UDOOboard/Docs.git
 
* Edit the docs accordingly

* Commit your local changes, indicating what you integrated\edited in the commit message 

	git commit -a
 
* Push changes to your repo
 
	git push https://yourgitrepo  master
 
* Send us a pull request

	git request-pull v1.0 hhttps://github.com/UDOOboard/Docs master
 
 
This Docs are generated with  **Daux.io**



**Daux.io** is an documentation generator that uses a simple folder structure and Markdown files to create custom documentation on the fly. It helps you create great looking documentation in a developer friendly way.


T
**Good:**

* 01_Getting_Started.md = Getting Started
* API_Calls.md = API Calls
* 200_Something_Else-Cool.md = Something Else-Cool
* _5_Ways_to_Be_Happy.md = 5 Ways To Be Happy

**Bad:**

* File Name With Space.md = FAIL

## Sorting

To sort your files and folders in a specific way, you can prefix them with a number and underscore, e.g. `/docs/01_Hello_World.md` and `/docs/05_Features.md` This will list *Hello World* before *Features*, overriding the default alpha-numeric sorting. The numbers will be stripped out of the navigation and urls. For the file `6 Ways to Get Rich`, you can use `/docs/_6_Ways_to_Get_Rich.md`

## Landing page

If you want to create a beautiful landing page for your project, simply create a `index.md` file in the root of the `/docs` folder. This file will then be used to create a landing page. You can also add a tagline and image to this page using the config file like this:

```json
{
	"title": "Daux.io",
	"tagline": "The Easiest Way To Document Your Project",
	"image": "<base_url>img/app.png"
}
```

Note: The image can be a local or remote image. Use the convention `<base_url>` to refer to the root directory of the Daux instance.

## Section landing page

If you are interested in having a landing page for a subsection of your docs, all you need to do is add an `index.md` file to the folder. For example, `/docs/01_Examples` has a landing page for that section since there exists a `/docs/01_Examples/index.md` file. If you wish to have an index page for a section without a landing page format, use the name `_index.md`



###Title:
Change the title bar in the docs

```json
{
	"title": "Daux.io"
}
```



###Toggling Code Blocks
Some users might wish to hide the code blocks & view just the documentation. By setting the `toggle_code` property to `true`, you can offer a toggle button on the page.

```json
{
	"toggle_code": true
}
```


###GitHub Repo:
Add a 'Fork me on GitHub' ribbon.

```json
{
	"repo": "justinwalsh/daux.io"
}
```

###Twitter:
Include twitter follow buttons in the sidebar.

```json
{
	"twitter": ["justin_walsh", "todaymade"]
}
```

###Links:
Include custom links in the sidebar.

```json
{
	"links": {
		"GitHub Repo": "https://github.com/justinwalsh/daux.io",
		"Help/Support/Bugs": "https://github.com/justinwalsh/daux.io/issues",
		"Made by Todaymade": "http://todaymade.com"
	}
}
```





Directory structure:
```
├── docs/
│   ├── index.md
│   ├── en
│   │   ├── 00_Getting_Started.md
│   │   ├── 01_Examples
│   │   │   ├── 01_GitHub_Flavored_Markdown.md
│   │   │   ├── 05_Code_Highlighting.md
│   │   ├── 05_More_Examples
│   │   │   ├── Hello_World.md
│   │   │   ├── 05_Code_Highlighting.md
│   ├── de
│   │   ├── 00_Getting_Started.md
│   │   ├── 01_Examples
│   │   │   ├── 01_GitHub_Flavored_Markdown.md
│   │   │   ├── 05_Code_Highlighting.md
│   │   ├── 05_More_Examples
│   │   │   ├── Hello_World.md
│   │   │   ├── 05_Code_Highlighting.md
```


## Support

If you need help using Daux.io, or have found a bug, please create an issue on the <a href="https://github.com/justinwalsh/daux.io/issues" target="_blank">GitHub repo</a>.
