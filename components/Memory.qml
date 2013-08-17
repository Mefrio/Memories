import QtQuick 2.0

// It is used only to get informations about memories

QtObject {

    id: memory

    function toJSON() {
        return {
            title: title,
            tags: tags,
            description: description,
            date: date,
            location: location,
            weather: weather,
            photos: photos
        }
    }

    function remove() {
        removeMemory(memory)
    }

    property string title;
    property string tags;
    property string description;
    property string date;
    property string location;
    property string weather;
    property string photos; // A list of photos divided by a '||'

    function getTags() {
        return tags.split(",")
    }

    function getShareString() {
        var max_length = 140
        var hashtag = "#memories"
        var string = ""
        // Add the title
        string += title
        // Add the description (if exists)
        if(description) {
            string += (": " + description)
            if(string.length > 100) {
                string = string.substring(0, 98) + "..."
            }
        }
        // Add the location (if exists)
        if(location)
            string += " @ " + location
        // Add the date
        string += " " + date
        // Add a nice hashtag
        string += " " + hashtag
        // Finally return the ready to be posted string
        if(string.length > max_length)
            string = string.substring(0, max_length - hashtag.length - 4) + "... " + hashtag
        return string
    }
}
