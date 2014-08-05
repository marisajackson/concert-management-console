#Features

* View Individual Concert Stats
* Create New Concerts
* Edit Concert Stats
* View Total Stats


# Stories

## User Creates A New Concert

As a user
In order to create a new concert
I want to enter 'new' on the main menu

Usage: ./concert new

**Acceptance Criteria:**

* User receives 3 prompts for Date, Venue, and Location
* Concert is saved in the the concert_info table

## User Views Total Stats
As a user
In order view total stats
I want to chose totals from the main menu

Usage: ./concert totals

**Acceptance Criteria:**

* This will display a list of the combined totals of all expenses and income and the total profit/loss

## User Views Concert List
As a user
In order view the list of concerts
I want to chose concerts from the main menu

Usage: ./concert concerts

**Acceptance Criteria:**

* This will display a list of the concerts currently in the database

## User Views Individual Concert Stats

As a user
In order to view the stats for a a concert
I want to chose the correct concert

Usage: ./concert (corresponding digit)

**Acceptance Criteria:**

* User selects a concert (via it's display number) to view it's details
* Displays the concert Headliner, Venue, Date
* User is prompted to view Expenses or Income

## User Edits Individual Concert Stats

As a user
In order to edit the concert stats
I want to choose the stat to be edited

**Acceptance Criteria:**

* Depending on the previous entry user sees either a list of expenses or income with their current amount.
* User can choose which amount they would like to edit via it's display number.
* The new amount is updated in the expenses or income table.
