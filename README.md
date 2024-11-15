# Passwordless X1280 (Rest API version)

## Introduction to Passwordless X1280
Passwordless X1280 is a passwordless software provided free of charge by the Passwordless Alliance to B2C online services worldwide. Developed based on the international standard ITU X.1280, Passwordless X1280 consists of server software for online service providers and a mobile app for online service users.

When online service providers and users adopt Passwordless X1280, users no longer need to remember and enter passwords for online services. Instead, the online service presents an automatic password to the user, who verifies it using the mobile app to log in to the online service. Passwordless X1280 shifts the responsibility of password proof from the user to the online service’s automatic password proof method, allowing users to access online services conveniently and securely.

Moreover, it enables out-of-band biometric authentication for all B2C online services using the biometric sensors on the user’s smartphone, eliminating the need for separate biometric sensors on each user device. Passwordless X1280 meets the needs of usability, security, and cost-effectiveness for both B2C online services and users, providing a free passwordless software.

## Passwordless X1280 app
+ Manage Passwordless for multiple online services with one app
+ You can register and manage multiple online services with a single Passwordless X1280 app. Since a private key is issued to the Passwordless X1280 app for each online service account that supports Passwordless, it offers excellent security. Users can manage Passwordless for all their online services with one app.
+ You can download the Passwordless X1280 app by scanning the QR code image below with your mobile device's camera.
  ![image](https://github.com/user-attachments/assets/0b144f67-0257-4b24-bc09-1d1dd54e1f52)

## Passwordless Alliance Members site 
Passwordless Alliance Members site will be referred to as Members site from now on.
To proceed with the process below, you have to sign up the Members site and the service of the web application to which you want to apply Passwordless X1280 must be registered.

[https://members.passwordlessalliance.org](https://members.passwordlessalliance.org)

## Project running environment
* Windows 11 Pro
* MariaDB 10.6.5
* eclipse 2022-03 (4.23.0)
* OpenJDK 11.0.15
* OpenJDK Runtime Environment 18.9

## Installing Passwordless X1280 servers with docker

   To follow the steps below, you will need to have the Passwordless X1280 server installed via docker.
   
   Please refer to the link below for how to install the Passwordless-X1280-single version.

   [https://hub.docker.com/r/dualauth/passwordless-x1280-single](https://hub.docker.com/r/dualauth/passwordless-x1280-single)


## Setting Passwordless X1280 authentication server

   After installing the passwordless X1280 server with docker, connect to it with a web browser.
   
   You must connect to https and port 8143, and the firewall for that port must be open.
   
   ![image](https://github.com/user-attachments/assets/3bc27928-ee44-4449-8d77-e058d60cc3b4)

   After that, click on "Advanced" and "Proceed to your-passwordlessX1280-domain (unsafe)".
   
   ![image](https://github.com/user-attachments/assets/0d8cb79d-f605-45e2-916f-1f37f1961de4)


   **If you set up a formal SSL certificate, you can skip the steps above and see the screen below.**


   If the passwordless X1280 server is properly installed, you will see a screen like this:
   
   ![image](https://github.com/user-attachments/assets/2d05f687-5243-4749-b444-b016e5be8db6)


   Go to the Members site to download the file containing information about the authentication server to upload.

   [https://members.passwordlessalliance.org](https://members.passwordlessalliance.org)

   Log in to the Members site and view information about your service in the service management menu.
   
   Click on "Download license key file" in the service information registered on the Members site and download the setting.ap file.

   ![image](https://github.com/user-attachments/assets/955c0286-0f8a-4cc6-a7e8-0d56e4564e4f)

   ![image](https://github.com/user-attachments/assets/23c024ac-ba41-4dc6-8ae2-f9341bf27cf5)


   Click "Choose File" button and upload the setting.ap file
   
   ![image](https://github.com/user-attachments/assets/285f8e7e-0450-4eae-a77b-335d72f0fe9c)


   After uploading the setting.ap file, if the screen below appears, the installation of the Passwordless X1280 server is complete.
   
   ![image](https://github.com/user-attachments/assets/913874f3-9b5a-48d5-b59c-88f6ca5ef7f4)


## Preparing to set up the web application server
  Log in to the Passwordless X1280 authentication server. (Default login ID/Password is admin/admin)

  Click the Service server menu.
  
  ![image](https://github.com/user-attachments/assets/926d11e0-a7bc-4b94-b899-3c3ce935995e)
  
  ① Server ID - Copy this value to notepad
  
  ② Issue Server Key - When you click this button, a pop-up window will appear. Copy the values ​​displayed there into notepad.
  
  ![image](https://github.com/user-attachments/assets/b5fc9dc2-3cea-4228-8d76-d57ecbc47fa2)

  
    * Caution
       The server key value changes every time you click.
       The pop-up window appears only once when you click on it.
       The server key value can only be viewed in the pop-up window and cannot be obtained from anywhere else.


## Applying Passwordless X1280 server ID and server key to web application server
  Modify the project's /src/main/resources/properties/config.properties file
  
  ![image](https://github.com/user-attachments/assets/6dbb0ae3-c100-4b82-94aa-be2a473cd61c)

  ① Apply the server ID value copied to notepad.
  
  ② Apply the server key value copied to notepad.
  
  ③ Change to your-passwordless-X1280-domain.


## Apply the members site changes
  If you modified the service information on the Members site, the authentication server may not operate properly.
  
  In this case, download a new setting.ap file from the Members site and upload it here.

  ![image](https://github.com/user-attachments/assets/afbc92e8-0155-41c1-9e9d-d70b1df1fdc7)



## How to use
+ Project source
  + Maven build in eclipse
    1. Project Explorer -> Maven (Mouse right click) -> Update Project...
    2. Select this project and click <b>OK</b> button

  + Maven build in STS (Spring Tool Suite)
    1. Menu -> Run -> Run Configurations -> Maven Build (Mouse right click) -> New Configuration
    2. [Name] -> <b>PasswordlessX1280</b> in the input field
    3. [Base directory] -> click <b>Workspace button</b>
    4. Select this project
    5. [Goals] Enter <b>clean install</b> in the input field
    6. Apply and click <b>Run</b> button

  + Run the local srever and access localhost to your browser.
    + Make sure the screen in the screenshot below appears.

    ![image](https://github.com/user-attachments/assets/4769cf6a-86d8-4019-9a4e-11575c11a08c)

+ Create an account on the sample project site
  1. Click <b>create account</b>.
  2. Enter your ID, password, and email, and then click <b>create</b> button.

    ![image](https://github.com/user-attachments/assets/0749b800-2b7e-4ebe-8e3f-692c565d5eef)

+ Register for passwordless service
  1. On the login screen of the browser, click <b>passwordless</b>.
  2. Click <b>passwordless Reg/Unreg</b>.
  3. Enter ID and password, and click <b>passwordless Reg/Unreg</b> button.

    ![image](https://github.com/user-attachments/assets/89950b14-06cf-4111-b325-b41581f04c61)

  5. When the QR Code appears on the screen, launch the passwordless X1280 app, click the <b>[+]</b> in the upper right corner, turn on the camera, and scan the QR Code.

    ![image](https://github.com/user-attachments/assets/dfff4447-d0ff-444c-a4d0-e0b894b05bc2)

+ Passwordless X1280 login
  1. On the login screen of the browser, enter only the ID without entering a password and click the login button.
  2. When a 6-digit number appears on the screen, check that the same number appears in the Passwordless X1280 app and click the OK button.
    (__If the 6-digit number in your browser and the number in the Passwordless X1280 app are the same, this indicates that no tampering has occurred.__)

    ![image](https://github.com/user-attachments/assets/6e0691a7-a812-4c75-9b35-e4e43179b4b3)

+ Applying Passwordless X1280 easier
  * This project (<b>PasswordlessX1280-with-Java-RestAPI-webservice</b>) requires you to implement both the registration screen and the login screen yourself.
  * If you use the <b>PasswordlessX1280-with-Java-UI-webservice</b> project, which provides a simple UI, you can apply Passwordless X1280 more easily because the screens are provided by default.

    [https://github.com/PasswordlessAlliance/PasswordlessX1280-with-Java-UI-webservice/tree/master](https://github.com/PasswordlessAlliance/PasswordlessX1280-with-Java-UI-webservice/tree/master)


## Who we are

![image](https://github.com/user-attachments/assets/78ab716f-fb04-44fc-a584-5d060aff6d8c)

[https://www.passwordlessalliance.org](https://www.passwordlessalliance.org/)

### Passwordless Alliance
The Passwordless Alliance aims to advance the passwordless world by providing free passwordless software to B2C online services worldwide.

Passwordless X1280 software, provided by the Passwordless Alliance, is a technology defined as X.1280 by ITU-T, the International Technology Standardization Organization under the United Nations. It allows online services to present an automatic password to the user, and the user confirms it with their smartphone, instead of the user entering the password and online services confirming it.

We want to create a password-free, secure, and convenient digitized world by letting online services take over the responsibility of proving passwords instead of users memorizing and changing them. Join us in creating a passwordless world!
