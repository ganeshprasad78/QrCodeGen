QrCodeGen
ruby - 2.6.2
rails - 6.0.3.2

run rake db:seed and you should have logins with different roles

1. Product name : GulfSea Cylcare DCA 5040
2. Product package : 	
3. Manufactured date : can use any date
4. Product code : 1CY15402D22
5. Application : Marine Cylinder Oil specially designed for modern Low Speed 2-stroke Marine Main Engines using Heavy Fuel Oil (HFO).
6. Product data sheet : https://www.gulf-marine.com/getfile/index/action/images/name/5ebe60d09c042.pdf/filename/PDS_GulfSea%20Cylcare%20DCA%205040%202020-03.pdf
7.Material Safety sheet : https://www.gulf-marine.com/getfile/index/action/images/name/5ed0ca91741b8.pdf/filename/GulfSea%20Cylcare%20DCA%205040H_HK_1.0.doc.pdf

Version 1:

1,2,,5,6, 7 are entered by either Technical/marketing team and assign to the Production team
3 and 4 filled by production team

Once both teams have filled 1 to 7 and Technical or marketing team click on Generate QR code and assign to printer button when tapped then should be assigned to the printer team.
Generated QR code and also the teachnical/marketing team and Production team should be able to see the generated QR code in there list of QR code tasks they have


Each team will have the List of task and status with following columns
Product name, Product Code, Assigned to, Status, QR code

Assigned to should say who has this for now(which team the task is currently handled by)
Status says, New(When its just added by Technical. Marketing team), In progress when its assigned to Production team, Complete(When QR code is generated by the Technical and marketing teams)

QR code when scanned should open on in a web page with all 7 details and the link as a short url to the respective Data sheet and safety sheet


Version 2:
1. Marketing or technical team create a master list of products with 1.2.5.6.7
Yes we can delete and we can keep them in archived tab. We can enable and disable will be good option I guess those disabled will be in archived tab

2. Production team will have New product button, clicking on it the the form with all 7 fields will be blank
3. Product Name will be drop down with all the master list created by the marketing and technical team
4. Production team selects the product name and auto fills everything apart from 3 and 4 which production team will fill and can generate a qr code and should be able to print. printer team keep as is


Also each field should have private checkbox only for marketing and technical team
When a qr code is scanned and the click we click on should be able to show only public info(not private) and a hardccoded code to be entered in a code text box and when entered we should show private info.


Masked product details should be displayed on entering 4 digit code









