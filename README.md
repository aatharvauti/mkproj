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
- [ ] `git init`
- [ ] `git remote add origin git@github.com:username/{$1}.git`
- [ ] `git branch -m main`
- [ ] `git add .`
- [ ] `git commit -m "initial commit"`
- [ ] `git push -u origin main`
- [ ] `code .`


### Requirements
---

- Install python packages
	
		python3 -m pip install -r requirements.txt

- wget tool
- idk if anything else, open an issue if something's missing :)

---
