# mkproj
---

# Goal: Automate Making Projects using Python & Shell

## What do I mean when I wanna start a Project?

#### Simple Answer:
- Create a New Directory
- Add README and .gitignore (Depending on the Project) 
- Do some magic using GitHub
- code . (mostly)

#### Technical Answer (and EL Plan):
- [x] ~~Help Menu~~
- [x] ~~Argument Parser will play a key role: DESIGN THE PROGRAM~~
- [x] ~~Navigate to $HOME/code (This is my projects folder)~~
- [x] ~~`mkdir $NAME && cd $NAME`~~
- [x] ~~`touch README.md && echo "# ${NAME}" >> README.md`~~
- [x] ~~`wget "bunch,of,arguments,again,depends,on,the,project"`~~
- [x] ~~Web Scraping using Selenium to Create a GitHub Repository~~
- [x] ~~`git init`~~
- [x] ~~`git remote add origin git@github.com:username/{$1}.git`~~
- [x] ~~`git branch -m main`~~
- [x] ~~`git add .`~~
- [x] ~~`git commit -m "initial commit"`~~
- [x] ~~`git push -u origin main`~~
- [x] `code .`


### Requirements
---

- Install python packages
	
		python3 -m pip install -r requirements.txt

- wget tool
- [Firefox Web Driver](https://dev.to/eugenedorfling/installing-the-firefox-web-driver-on-linux-for-selenium-d45)
- idk if anything else, open an issue if something's missing :)

---
