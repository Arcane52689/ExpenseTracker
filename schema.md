# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null



## sessions
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
token           | string    | not null, unique
user_id         | integer   | not null, foreign key (references user)
browser_info    | text      |

## oauths
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key (references user)
uid             | string    | not null, indexed with provider, unique with provider
provider        | string    | not null, indexed with uid, unique with uid

## profiles
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key (references user)
             | string    | not null, indexed with provider, unique with provider
provider        | string    | not null, indexed with uid, unique with uid

## expenses
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key (references user)
category_id     | integer   | not null, foreign key (references category)
provider        | string    | not null, indexed with uid, unique with uid

## categories
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
parent_id       | integer   | foreign key (references category), unique with parent_id, indexed
name            | string    | not null, indexed with parent_id, unique with parent_id



<!--
## vehicle_sales
column name         | data type | details
--------------------|-----------|-----------------------
id                  | integer   | not null, primary key
user_id            | integer   | not null, foreign key (references users)
Chasis Number/VIN   | string    | not null
vehicle_description | text      | not null
vehicle condition   | string    | not null
title_status        | string    | not null
vehicle_id          | integer   | not null, foreign key (references vehicles)
location(zip code)  | integer   | not null (eventually)

## looking_for_requests
column name   | data type | details
--------------|-----------|-----------------------
id            | integer   | not null, primary key
user_id       | integer   | not null, foreign key (references users)
title         | string    | not null
vehicle_id    | integer   | not null
part_number   | integer   |
body          | text      |
location      | integer   |

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null



## sessions
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
token           | string    | not null, unique
user_id         | integer   | not null, foreign key (references user)


## Vehicles:
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
make            | string    | not null
model           | string    | not null
year            | integer   | not null

## Images:
column name       | data type | details
------------------|-----------|-----------------------
id                | integer   | not null, primary key
file_location     | string    | not null
requestable_id    | string    | not null
requestable_type  | string    | not null
(maybe have a user_id?) -->
