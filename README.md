

# Rerefence link :
1. https://www.youtube.com/watch?v=oNoRw69ro2k&ab_channel=NativeNotify


# Case default :
{<br/>
    "aps":{<br/>
        "alert":"Test",<br/>
        "sound":"default",<br/>
        "badge":1<br/>
    }<br/>
}

# Case 1 : Long Text Notification

- Description :
- Purpose : This notification informs the user about a promotional offer for adding money through PPC Bank, emphasizing ease, speed, and potential savings.
- Title : "WeCafé App" – The name of the app sending the notification.
- Body : The body contains a long text with emojis and both Khmer and Latin script. It encourages users to order coffee and highlights the advantages of the service, like earnings from PPC Bank transactions.
- Badge : Sets the app’s notification badge count to 1.
- Content Type: Standard text alert, with a focus on marketing or promotional content.

{<br/>
    "aps":{<br/>
        "alert": {<br/>
            "title": "WeCafé App",<br/>
            "body": "🤑 ចំណេញ ពេល បញ្ចូលលុយតាម　ＰＰＣ　Ｂａｎｋ　បានរៀង រាល់ ថ្ងៃ។ 💸 បញ្ចូលលុយតាម PPC Bank កាន់តែ ងាយស្រួល រហ័ស និង ចំណេញ ច្រើន តោះ កុម្ម៉ង់ Coffee ឥឡូវ នេះ 👉🏻"<br/>
        },<br/>
        "badge":1<br/>
    }<br/>
}

# Case 2 : Notification with a JPG Image
- Description:
- Purpose: To announce new items arriving at WeCafé, aimed at KOSIGNer, a specific audience.
- Title: "WeCafé new items Arrived" – Brief and informative, promoting new items.
- Body: Encourages users to try the new products, asking if they've had the opportunity to drink them yet.
- Image: The notification includes a JPEG image (URL provided in attachment-url), which will be shown along with the notification on devices that support media attachments.
- Badge: Sets the notification badge count to 1.
- Sound: Default system notification sound.
- Content Type: Marketing or promotional content, enhanced by an image of new items in the café.

{<br/>
  "aps": {<br/>
    "content-available":1,<br/>
     "mutable-content":"1",<br/>
    "alert": {<br/>
      "title": "WeCafé new items arrived",<br/>
      "body": "The new items in WeCafé for KOSIGNer is almost here. Have you drink it already."<br/>
    },<br/>
    "badge": 1,<br/>
    "sound": "default"<br/>
  },
  "attachment-url": "https://static.wixstatic.com/media/1d5343_e1662d9703c74392a3e83c0b0a2f24b9~mv2.jpg"<br/>
}



# Case 3 : Notification with a PNG Image
- Description :
- Purpose : Promotes a 50% discount during the Pchum Ben festival, a traditional Khmer holiday.
- Title : "WeCafé ពិធីបុណ្យភ្ផុំបិណ្ឌ បញ្ចុះតម្លៃ ៥០% 🥳🤝" – Celebratory title in Khmer with emojis.
- Body : The body text continues in Khmer, urging users to take advantage of the discount before the promotion ends.
- Image : This notification includes a PNG image (URL provided), related to the festival, likely showing promotional or celebratory visuals.
- Badge : Sets the badge count to 1.
- Sound : Plays the default system notification sound.
- Content Type : A festive and promotional notification with image support to celebrate a national holiday.

{<br/>
  "aps": {<br/>
    "content-available":1,<br/>
     "mutable-content":"1",<br/>
    "alert": {
      "title": "WeCafé ពិធីបុណ្យភ្ផុំបិណ្ឌ បញ្ចុះតម្លៃ  ៥០% 🥳🤝",<br/>
      "body": "ដើម្បីអបអរសាទ័រ បុណ្យភ្ជុំបិណ្ឌ ប្រពៃណីជាតិខ្មែរ ប្រូម៉ូសិនពិសេស ពីក្រុមហ៊ុនខ្មែរ២៤ ប្រញ៉ាប់ឡើង ប្រញ៉ាប់ឡើង >>ផុតកំណត់ថ្ងៃនេះ"<br/>
    },<br/>
    "badge": 1,<br/>
    "sound": "default"<br/>
  },<br/>
  "attachment-url": "https://png.pngtree.com/png-vector/20240820/ourlarge/pngtree-khmer-pchum-ben-day-2024-vector-png-image_13526103.png"<br/>
}

# Case 4 : Notification with a GIF Image
- Description :
- Purpose : This notification is quirky and humorous, as it mentions that the café is missing a certain item (likely a joke), encouraging users to order.
- Title : "WeCafé Store 🔔⚠️🔔" – Title with emoji alerts.
- Body : The body is in Khmer, mentioning the café's missing item and encouraging users who haven’t placed an order yet to do so.
- GIF Image : The notification includes a GIF attachment (URL provided), adding a playful visual element to the message.
- Badge : Sets the badge count to 1.
- Sound : Plays the default system notification sound.
- Content Type : A humorous, light-hearted notification with media attachment to engage users through visuals and humor.
{<br/>
  "aps": {<br/>
    "content-available":1,<br/>
     "mutable-content":"1",<br/>
    "alert": {<br/>
      "title": "WeCafé Store 🔔⚠️🔔",<br/>
      "body": "សួស្តីចា​ ខាងហាងកាហ្វេ បានបាត់ ទឹកត្រចៀកកាំ ។​​ បើសិន ជាមានអ្នក មិនទាន់ បាន​កម្មង់ទេ​ សូម​ចូលទៅ កម្មង់ផង ណា។​ សូមអរគុណ"<br/>
    },<br/>
    "badge": 1,<br/>
    "sound": "default"<br/>
  },
  "attachment-url": "https://media1.tenor.com/m/twFtmlVLUDQAAAAd/cat.gif"<br/>
}



# Case 5 : Notification with Video
- Description :
- Purpose : To inform users about an educational or environmental video, related to our planet's beauty and climate change.
- Title : "Our Planet | One Planet 🌎🌎" – The title reflects the theme of the video, accompanied by Earth emojis.
- Body : The body text invites the user to explore natural beauty and environmental concerns.
- Video Attachment: This notification includes an MP4 video (URL provided), allowing users to watch directly from the notification.
- Badge : Sets the badge count to 1.
- Category : The category (CustomSamplePush) might be used for grouping or defining custom notification behaviors.
- Description : Provides additional information about the video (e.g., views and upload date).
- Content Type : Educational and engaging multimedia notification with a video attachment

{<br/>
   "aps" : {<br/>
         "content-available":1,<br/>
     "mutable-content":1,<br/>
      "alert" : {<br/>
         "title" : "Our Planet | One Planet 🌎🌎",<br/>
         "body" : "Experience our planet's natural beauty and examine how climate change."<br/>
      },<br/>
       "category" : "CustomSamplePush",<br/>
      "sound": "default",<br/>
      "badge": 1,<br/>
   },
     "attachment-url" : "https://media.istockphoto.com/id/1459585081/video/digital-abstract-network-grid-over-the-earth-artificial-intelligence-neural-network-growing.mp4?s=mp4-640x640-is&k=20&c=-vKDwYFF-onrZVZJR9hdA1V89xkq1pqG6qbKL0s9quo=",<br/>
   "description": "28,658,750 views  Apr 17, 2020",<br/>
   "Simulator Target Bundle": "kh.com.sothea.customnotifications"<br/>
}

# Case 6 : Notification with Map Data
- Description :
- Purpose : This notification provides location-based information, perhaps for a promotional event or visiting guide.
- Title : "WeCafé Store 🤩🙌🏻" – A welcoming and enthusiastic title with emojis.
- Body : Informs the user about visiting zones and starting points, using a map for guidance.
- Map Data : The notification includes latitude, longitude, and radius values, which might be used to display a location on a map.
- GIF Attachment: A GIF is also attached (URL provided), possibly to add a light-hearted
{<br/>
   "aps" : {<br/>
       "content-available":1,<br/>
       "mutable-content":1,<br/>
      "alert" : {<br/>
         "title" : "WeCafé Store 🤩🙌🏻🗺️",<br/>
         "body" : "Ready to start visiting? Here are some important reminders: Refer to the map below to see your visting zones and starting points."<br/>
      },<br/>
       "category" : "CustomSamplePush",<br/>
      "sound": "default",<br/>
      "badge": 1,<br/>
   },<br/>
   "latitude" : 11.563560095704341,<br/>
   "longitude" : 104.88209171466077,<br/>
   "radius" : 500,<br/>
   "Simulator Target Bundle": "kh.com.sothea.customnotifications"<br/>
}

# Research link :

1. https://medium.com/@lucasgoesvalle/custom-push-notification-with-image-and-interactions-on-ios-swift-4-ffdbde1f457
2. https://www.alfianlosari.com/swift/

3. https://www.alfianlosari.com/posts/building-custom-interactive-remote-push-notification-in-ios/

4. https://www.kodeco.com/books/push-notifications-by-tutorials/v2.0/chapters/11-custom-interfaces
5. https://medium.com/swiftable/customizing-the-appearance-of-notifications-in-swift-7cf36a544f98

6. Debug an extension : https://stackoverflow.com/questions/38140158/debug-notification-extensions/53498310#53498310
