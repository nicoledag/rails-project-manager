[ ] Add Readme file.

[X] Include many to many relationship.
    - User has many projects.  Project belongs to User.  User has many clients through projects.
    - Client has many projects.  Client belongs to User.  Client has many users through projects.

[X] Include on has_many and belongs_to relatonship.
    - Project has many comments.  Comment belongs to a Project.

[ ] You must include a nested new route with form that relates to the parent resource
  client/1/project/1/new
[ ] You must include a nested index or show route
  client/1/project/1

[X] Include Authenticationsystem
    -Bcrypt

[ ] Include Omniauth

[ ] Include validations
    User - validates presence and uniqueness of username and email.
    Client - validates presence and uniqueness of name.

[ ] Include one scope method

[ ] Perform CRUD actions on the following models
    - Client
    - Project
    - Comment
    - User, only create and read.
