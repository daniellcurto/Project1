# Basic Git Usage:

# How to add to git:
git add [filename]  

# How to commit:
git commit

# How to push:
git push

Retrieved from: Routine use of git and github
https://kbroman.org/github_tutorial/pages/routine.html
on October 13, 2020

# Akshay Ranganath's Blogs
# Blogs about Image Optimization, Web Performance, SEO and web technology.

Blog About
Handling a Git Pull request with merge conflict
Written on June 23, 2017
When working with Git, the relatively complex tasks are issuing a pull request and then merging with conflicts. Due to the prevalence of UIs, pull requests are now quite simple. However, merge requests that have a conflict are a little bit more hard to handle. Here’s how I get this done.

pull request

In this example, let’s work with 2 branches:

prod (the final source of truth)
feature-1 (the branch issuing pull request)
Step 1: Verify your local repo
To start off, ensure that you have the latest files for the prod branch.

git checkout prod
git pull origin prod
This will ensure that the files on local repository are in-sync with your remote git repo (Github/Bitbucket, etc).

Step 2: Switch to branch
The next step is to switch to the branch that you want to merge. While doing it, ensure that you also pull the latest files from your remote server.

git checkout feature-1
git pull origin feature-1
Step 3: Try to merge
At this point, we have the latest files for both the “prod” and “feature-1” branch locally. You are also on the branch that needs to be merged. Now try this branch to your target branch/master.

git merge prod
You should see output like this:

Auto-merging origin_settings.py
CONFLICT (content): Merge conflict in origin_settings.py
Auto-merging aggregator.py
Automatic merge failed; fix conflicts and then commit the result.
So git is saying that:

File aggregator.py has some change but, it can be merged with no conflict.
File origin_settings.py has some changes that overlap. There is a merge conflict and it cannot automatically merge the change.
Git would have also tried to merge the files and added the conflict related information to the file that has issues. In this case, it is a file named origin_settings.py.

Step 4: Resolve the merge conflict
To resolve the conflict, open the file and look for lines like this:

	data = open('cert2.txt').read()
	cert = TLSCertificate()
	<<<<<< HEAD
	print cert.loadCertificate(data)
	====== prod
	# print "hello world"
In this case, git says that the line to print “Hello world” from prod branch was over-written with a different print statement in the branch. Manually, you’ll need to fix this. So in my case, I fixed it this way:

	data = open('cert2.txt').read()
	cert = TLSCertificate()	
	print cert.loadCertificate(data)	
Step 5: Check in changes
Now, commit the fixes to the branch.

git add origin_settings.py
git commit -m "some comment"
git push origin feature-1
Step 6: Merge the branch
At this point, the conflicts should be gone. You can now log in to your remote server like github or bitbucket and hit the merge request. Once this completes, the pull request is automatically marked as complete.

When completing the merge, there is an option to close the branch as well. Use this option if you feel that the branch created is no longer necessary.

Hope you find this useful!

Retrieved from https://akshayranganath.github.io/Git-Pull-Handling-Merge-Conflict/ on October 13, 2020

# Creating an issue
# Issues can be used to keep track of bugs, enhancements, or other requests.

Any GitHub user can create an issue in a public repository where issues have not been disabled.

You can open a new issue based on code from an existing pull request. For more information, see "Opening an issue from code."

You can open a new issue directly from a comment in an issue or a pull request review. For more information, see "Opening an issue from a comment."

Tip: You can also create an issue using the GitHub CLI. For more information, see "gh issue create" in the GitHub CLI documentation.

If you're using a project board to track and prioritize your work, you can convert project board notes to issues. For more information, see "About project boards" and "Adding notes to a project board."

Tips: Project maintainers can choose to:

Create an issue template for a repository. Templates include prompts for information in the body of an issue. For more information, see "About issue and pull request templates."
Disable issues for a repository. For more information, see "Disabling issues." Pull requests can't be turned off and are always available.
On GitHub, navigate to the main page of the repository.

Under your repository name, click  Issues.

Issues tab
Click New issue.

New Issues button
If there are multiple issue types, click Get started next to the type of issue you'd like to open.

Select the type of issue you want to create
Optionally, click Open a blank issue. if the type of issue you'd like to open isn't included in the available options.

Link to open a blank issue
Type a title and description for your issue.

A sample issue
If you're a project maintainer, you can assign the issue to someone, add it to a project board, associate it with a milestone, or apply a label.

When you're finished, click Submit new issue.

Copied from: https://docs.github.com/en/free-pro-team@latest/github/managing-your-work-on-github/creating-an-issue on October 13, 2020