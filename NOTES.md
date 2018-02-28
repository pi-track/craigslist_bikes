# craigslist-bikes-cli

Building a CLI to search craigslist philly for bikes and display/sort them. Starting with bikes (because I personally don't search craigslist for anything else) and philly (because I live here) but a goal is to build this so it is open to flexible extension.

## planned functionality
1. doop doop doop

The user experience is something like this.
user types craigslist-bikes
and it asks me a few things specifying my search.
1. What city?
2. What zip code?
3. Within what radius?
4. Posted today?
5. Price Min/Max
6. Any search criteria?

These criteria are all optional and are used to generate the search URL to craigslist. If none are entered it will do some default search logic and display X number of results.  

## Classes

### CommandLineInterface
Handles spinning up the Command Line Interface and flow for user interaction.

### URLGenerator
Gets criteria from the user for the search and turns that into a URL that we can call to get the results we're looking for.

### Scraper
Takes a URL and uses Nokogiri to search for attributes. Puts them in a hash probably.

### Bike
Creates Bike Objects for each search result.

### Display
Not sure if this is a
