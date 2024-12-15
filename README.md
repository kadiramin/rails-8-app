<<<<<<< HEAD
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
I'd be happy to help you set up your personal portfolio Rails project with articles, a blog, and a contact form! Here's a step-by-step guide to help you get everything up and running. I'll break down the process into stages:

### Step 1: Set up the Rails Project
If you haven’t already created the project, you can do so with the following command:

```bash
rails new portfolio --skip-javascript --skip-turbolinks --skip-test
cd portfolio
```

This creates a new Rails project. The `--skip-javascript`, `--skip-turbolinks`, and `--skip-test` flags are optional based on your needs, but they simplify the setup.

### Step 2: Set Up the Database
Rails uses SQLite by default for development. If you're okay with that, you can continue. If you need to use PostgreSQL or MySQL, you can adjust the `config/database.yml` file later.

Run:

```bash
rails db:create
rails db:migrate
```

### Step 3: Create the Articles Model and Controller
For the blog posts (articles), you'll need a model to store them.

1. Generate the model and controller for articles:

   ```bash
   rails generate model Article title:string body:text
   rails generate controller Articles index show new create edit update destroy
   ```

   This creates the Article model with a `title` and `body`, along with a controller to manage the CRUD actions.

2. Migrate the database to create the `articles` table:

   ```bash
   rails db:migrate
   ```

### Step 4: Set Up Routes
In `config/routes.rb`, set up the routes for the articles and the home page (where you'll probably want a list of recent blog posts).

```ruby
Rails.application.routes.draw do
  root 'home#index'  # The home page
  resources :articles
end
```

This will generate RESTful routes for the `Articles` resource.

### Step 5: Create the Articles Views
Next, create the views for listing and displaying articles.

- `app/views/articles/index.html.erb` (list all articles):

```erb
<h1>Blog Posts</h1>
<% @articles.each do |article| %>
  <h2><%= link_to article.title, article_path(article) %></h2>
  <p><%= truncate(article.body, length: 150) %></p>
  <p><%= link_to 'Read more', article_path(article) %></p>
<% end %>
```

- `app/views/articles/show.html.erb` (display individual article):

```erb
<h1><%= @article.title %></h1>
<p><%= @article.body %></p>
<p><%= link_to 'Back to all articles', articles_path %></p>
```

### Step 6: Home Controller for Portfolio Overview
Create a controller for the homepage (e.g., `home_controller`).

```bash
rails generate controller Home index
```

Then, set up the home page to display a brief portfolio summary and a list of blog posts.

In `app/controllers/home_controller.rb`:

```ruby
class HomeController < ApplicationController
  def index
    @articles = Article.limit(3).order(created_at: :desc)  # Display recent posts
  end
end
```

In `app/views/home/index.html.erb`:

```erb
<h1>Welcome to My Portfolio</h1>
<p>This is a personal portfolio showcasing my work and articles.</p>

<h2>Recent Blog Posts</h2>
<% @articles.each do |article| %>
  <h3><%= link_to article.title, article_path(article) %></h3>
  <p><%= truncate(article.body, length: 100) %></p>
<% end %>
<%= link_to 'All Articles', articles_path %>
```

### Step 7: Contact Form
Create a controller and views for the contact form. You can use `ActionMailer` for sending emails, but for simplicity, let’s just create the form and display it.

1. Generate a controller for the contact form:

```bash
rails generate controller Contacts new create
```

2. Set up the routes for the contact form in `config/routes.rb`:

```ruby
resources :contacts, only: [:new, :create]
```

3. In `app/controllers/contacts_controller.rb`, set up the new form and create action:

```ruby
class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Thank you for reaching out!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem with your submission."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
```

4. Create the contact form in `app/views/contacts/new.html.erb`:

```erb
<h1>Contact Me</h1>

<%= form_with model: @contact, local: true do |form| %>
  <% if @contact.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@contact.errors.count, "error") %> prohibited this contact from being saved:</h2>
      <ul>
        <% @contact.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div>
    <%= form.label :name %>
    <%= form.text_field :name %>
  </div>

  <div>
    <%= form.label :email %>
    <%= form.email_field :email %>
  </div>

  <div>
    <%= form.label :message %>
    <%= form.text_area :message %>
  </div>

  <div>
    <%= form.submit "Send Message" %>
  </div>
<% end %>
```

### Step 8: Set Up a Contact Model (Optional)
If you want to save the contact messages to your database, you can create a model for contacts.

```bash
rails generate model Contact name:string email:string message:text
rails db:migrate
```

### Step 9: Add Some Basic Styling
You can add simple styling by editing the `app/assets/stylesheets/application.css` file or using a framework like Bootstrap or Tailwind CSS for a more polished look.

### Step 10: Test the App
Now you can start the Rails server to see everything in action:

```bash
rails server
```

Visit `http://localhost:3000` to see your homepage with recent articles. You can also access `http://localhost:3000/articles` to view all articles, and the contact form will be at `http://localhost:3000/contacts/new`.

---

That’s a basic setup for your portfolio app with articles and a contact form! You can extend this with more features like image uploads, rich text editors for the articles, and even email notifications for the contact form using `ActionMailer`.

Let me know if you need further help with any of the steps!
>>>>>>> 20b2a5b (Add contact page)
