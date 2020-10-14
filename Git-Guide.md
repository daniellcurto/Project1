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


Issues are a great way to keep track of tasks, enhancements, and bugs for your projects. They’re kind of like email—except they can be shared and discussed with the rest of your team. Most software projects have a bug tracker of some kind. GitHub’s tracker is called Issues, and has its own section in every repository.

Highlighting navigation

For example, let’s take a look at Bootstrap’s Issues section:

List of issues

GitHub’s issue tracking is special because of our focus on collaboration, references, and excellent text formatting. A typical issue on GitHub looks a bit like this:

An example issue

A title and description describe what the issue is all about.

Color-coded labels help you categorize and filter your issues (just like labels in email).

A milestone acts like a container for issues. This is useful for associating issues with specific features or project phases (e.g. Weekly Sprint 9/5-9/16 or Shipping 1.0).

One assignee is responsible for working on the issue at any given time.

Comments allow anyone with access to the repository to provide feedback.


Milestones, Labels, and Assignees
Once you’ve collected a lot of issues, you may find it hard to find the ones you care about. Milestones, labels, and assignees are great features to filter and categorize issues.

You can change or add a milestone, an assignee, and labels by clicking their corresponding gears in the sidebar on the right.

Viewing labels

If you don’t see edit buttons, that’s because you don’t have permission to edit the issue. You can ask the repository owner to add you as a collaborator to get access.

Milestones
Viewing Milestones

Milestones are groups of issues that correspond to a project, feature, or time period. People use them in many different ways in software development. Some examples of milestones on GitHub include:

Beta Launch — File bugs that you need to fix before you can launch the beta of your project. It’s a great way to make sure you aren’t missing anything.

October Sprint — File issues that you’d like to work on in October. A great way to focus your efforts when there’s a lot to do.

Redesign — File issues related to redesigning your project. A great way to collect ideas on what to work on.

Labels
Labels are a great way to organize different types of issues. Issues can have as many labels as you want, and you can filter by one or many labels at once.

Viewing label listings

Assignees
Each issue can have an assignee — one person that’s responsible for moving the issue forward. Assignees are selected the same way milestones are, through the grey bar at the top of the issue.


Notifications, @mentions, and References
By using @mentions and references inside of Issues, you can notify other GitHub users & teams, and cross-connect issues to each other. These provide a flexible way to get the right people involved to resolve issues effectively, and are easy to learn and use. They work across all text fields on GitHub — they’re a part of our text formatting syntax called GitHub Flavored Markdown.

Example of Markdown

If you’d like to learn more, have a look at Mastering Markdown.

Notifications
Notifications are GitHub’s way to keep up to date with your Issues. You can use them to find out about new issues on repositories, or just to know when someone needs your input to move forward on an issue.

There are two ways to receive notifications: via email, and via the web. You can configure how you receive notifications in your settings. If you plan on receiving a lot of notifications, we like to recommend that you receive web + email notifications for Participating and web notifications for Watching.

Screenshot of notifications

With these settings, you receive emails when people specifically mention you, then visit the web-based interface to keep up to date with repositories you’re interested in.

You can access your notifications through the notifications screen. This screen is nice for scanning many notifications at once and marking them as read or muting the thread. Try using keyboard shortcuts to speed up your workflow here — press ? on the page to see which shortcuts are available.

Screenshot of an individual notification

Muted threads won’t show up as unread again until you are specifically @mentioned again. This makes muting a great strategy for threads that you have little interest in (perhaps a sub-system that you aren’t familiar with). If you mark an issue as read, it will stay that way until someone comments on the thread again.

GitHub also syncs read/unread status for email notifications — if you read a notification in your email client, it will be marked as read in the web-based interface (make sure you allow your email client to display images if you’d like this functionality).

@mentions
@mentions are the way that we reference other GitHub users inside of GitHub Issues. Inside of the description or any comment of the issue, include the @username of another GitHub user to send them a notification. This works very similar to how Twitter uses @mentions.

We like to use the /cc syntax (an abbreviation for carbon copy) to include people in issues:

It looks like the new widget form is broken on Safari. When I try and create the widget, Safari crashes. This is reproducible on 10.8, but not 10.9. Maybe a browser bug?

/cc @kneath @jresig

This works great if you know the specific users to include, but many times we’re working across teams and don’t really know who might be able to help us. @mentions also work for Teams within your GitHub organization. If you create a Team called browser-bugs under the @acmeinc organization, you can reference the team with @mentions:

/cc @acmeinc/browser-bugs

This will send notifications to every member of the browser-bugs team.

References
Often times issues are dependent on other issues, or at least relate to them and you’d like to connect the two. You can reference issues by typing in a hashtag plus the issue number.

Hey @kneath, I think the problem started in #42

When you do this, we’ll create an event inside of issue #42 that looks something like this:

Screenshot of creating a reference

Issue in another repository? Just include the repository before the name like kneath/example-project#42.

One of the more interesting ways to use GitHub Issues is to reference issues directly from commits. Include the issue number inside of the commit message.

Screenshot of referencing a commit

By prefacing your commits with “Fixes”, “Fixed”, “Fix”, “Closes”, “Closed”, or “Close” when the commit is merged into main, it will also automatically close the issue.

References make it possible to deeply connect the work being done with the bug being tracked, and are a great way to add visibility into the history of your project.


Search
At the very top of each page is a search box that lets you search through issues.

Screenshot of making a search

You can scope search results by:

Keyword, such as, all issues mentioning the sidebar

State, such as, all issues mentioning the sidebar that are closed

Assignee, such as, all issues mentioning the sidebar that were assigned to @mdo

Our Help article on searching Issues can show you other ways to search: using created/updated dates, labels, authors, comment counts, by repository owner, and more.


Overviews & Reports
Outside of the Issues section, there are two other pages that help summarize what’s going on with Issues across your repository and across all of your repositories.

The Issue Dashboard
If you’re looking for a broader listing of all of your issues across many projects, the Issues Dashboard can be a great tool. The dashboard works very similar to the issues section, but collects issues differently:

All issues in repositories you own and collaborate on
Issues assigned to you
Issues you’ve created
If you use organizations, each one has its own Issues dashboard that separates out Issues within the organization.

Pulse
Underneath each repository is a section called Pulse — Pulse is a snapshot of everything that’s happened in the repository in the past week (or day, or past 3 months, etc).

Screenshot of the Pulse feature

It’s a great way to catch up with repositories when you’ve been away and don’t want the granularity notifications offer when watching a repository.


Other Uses for Issues
Issues are great for tracking all kinds of things — and GitHub is a great place to easily share and collaborate on your issues. Here’s some of our favorites:

Bug tracker for your open source projects

Request for recipes (maybe you have a good gluten-free pizza dough recipe?)

Fin
Now congratulate yourself — that was a lot to read! Issue management is one of the most powerful tools at any developer’s disposal. I guess all that’s left is to actually fix the bugs now.

Last updated July 24, 2020

Copied from https://guides.github.com/features/issues/ on October 13, 2020