# Rerefence link :
1. https://www.youtube.com/watch?v=oNoRw69ro2k&ab_channel=NativeNotify


# Case default :
{
    "aps":{
        "alert":"Test",
        "sound":"default",
        "badge":1
    }
}

# Case long text :
{
    "aps":{
        "alert": {
            "title": "WeCafé App",
            "body": "WeCafé ពិតជាមានសេចក្តីសោមនស្សរីករាយយ៉ាងខ្លាំង ក្នុងការអោយដំណើរការកម្មវីធីរបស់ខ្លួន នៅក្នុង KOSIGN 🥳🤘🏻😍"
        },
        "badge":1
    }
}



# Case with with image :

{
  "aps": {
    "content-available":1,
     "mutable-content":"1",
    "alert": {
      "title": "WeCafé App បញ្ចុះតម្លៃរហូតដល់ 50% ~",
      "body": "🤑 ចំណេញ ពេល បញ្ចូលលុយតាម PPC BANK បានរៀង រាល់ ថ្ងៃ។ 💸 បញ្ចូលលុយតាម PPC Bank កាន់តែ ងាយស្រួល រហ័ស និង ចំណេញ ច្រើន តោះ កុម្ម៉ង់ Coffee ឥឡូវ នេះ ដើម្បី ទទួលបាន ការ បញ្ចុះតម្លៃរហូតដល់ 50%  👉🏻"
    },
    "badge": 1,
    "sound": "default"
  },
  "attachment-url": "https://static.wixstatic.com/media/1d5343_e1662d9703c74392a3e83c0b0a2f24b9~mv2.jpg"
}

# Case with with video :

{
   "aps" : {
      "alert" : {
         "title" : "A new app. Introducing WABOOKS",
         "body" : "Facing Problems with Paper or Excel Accounting? WABOOKS make it simple & Smart."
      },
      "sound": "bingbong.aiff",
      "badge": 3,
   },
   "videoId" : "QeXuMOZJ8To",
   "description": "released : Sep 28, 2010",
   "Simulator Target Bundle": "com.alfianlosari.apnspushsimulate"
}



# Research link :

1. https://medium.com/@lucasgoesvalle/custom-push-notification-with-image-and-interactions-on-ios-swift-4-ffdbde1f457
2. https://www.alfianlosari.com/swift/

3. https://www.alfianlosari.com/posts/building-custom-interactive-remote-push-notification-in-ios/

4. https://www.kodeco.com/books/push-notifications-by-tutorials/v2.0/chapters/11-custom-interfaces
5. https://medium.com/swiftable/customizing-the-appearance-of-notifications-in-swift-7cf36a544f98

6. Debug an extension : https://stackoverflow.com/questions/38140158/debug-notification-extensions/53498310#53498310
