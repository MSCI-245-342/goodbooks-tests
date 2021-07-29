# goodbooks-tests

This respository contains automated tests for testing, in part, the GoodBooks assignment.

The tests are unit tests written to check the methods of the various models written to finish the GoodBooks tasks.

To add these tests to your app, you need to do the following:

1. Make yourself a new Codio project.  To do this, in Codio:
  + click on Build -> My Projects
  + click on New Project
  + Click on "Click here to import"
  + Click on "Browse" next to empty stack
  + Click on the UniversityOfWaterloo / MSCI-245-S21-and-342-W22 stack
  + Name your project, etc.
  + Go into your new project and start a terminal.

2. From the terminal in your new project, clone your goodbooks repo to a directory named goodbooks:
  + git clone git@github.com:MSCI-245-S21/hw-goodbooks-YourGitHubUserName.git goodbooks

3. Assuming you now have your GoodBooks app located at: /home/codio/workspace/goodbooks, do
```
cd /home/codio/workspace
echo "gem 'rexml'" >> goodbooks/Gemfile 
git clone git@github.com:MSCI-245-342/goodbooks-tests.git
cp goodbooks-tests/test/*.rb goodbooks/test/ 
cp goodbooks-tests/test/models/*.rb goodbooks/test/models/
```
4. Now, install your app:
```
cd goodbooks
bundle install
rails db:create db:migrate db:seed
```

5. Be sure your app is working.  Run the server, click "Box Url" and check it out.
```
rails server -b 0.0.0.0
```

6. Now, you can run the automated tests:
```
rails test --verbose
```
