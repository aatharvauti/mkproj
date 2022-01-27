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
- [x] Help Menu
- [x] Argument Parser will play a key role: DESIGN THE PROGRAM
- [ ] Navigate to $HOME/code (This is my projects folder)
- [ ] `mkdir $1` 
- [ ] `touch README.md && echo $1 > README.md`
- [ ] `gi "bunch,of,arguments,again,depends,on,the,project"`
- [ ] `git init`
- [ ] Web Scraping using Selenium to Create a GitHub Repository
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

- [gi command line](https://docs.gitignore.io/install/command-line)
- idk if anything else, open an issue if something's missing :)

---