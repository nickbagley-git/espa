# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EventApp.Repo.insert!(%EventApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias EventApp.Repo
alias EventApp.Users.User
alias EventApp.Events.Event
alias EventApp.Comments.Comment

defmodule Inject do

  def user(name, email, pass) do
    hash = Argon2.hash_pwd_salt(pass)
    Repo.insert!(%User{name: name, email: email, password_hash: hash})
  end
end

alice = Inject.user("alice", "alice@balls.com", "password")
bob = Inject.user("bob", "bob@balls.com", "password2")
tim = Inject.user("tim", "tim@balls.com", "password3")

e1 = %Event{user_id: alice.id, name: "party", date: "07/12/2000", description: "plz come"}
e2 = %Event{user_id: bob.id, name: "orgy", date: "08/12/2000", description: "plz come plz"}



Repo.insert!(e1)
Repo.insert!(e2)
