package models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SE150853 Nguyen Huynh Minh Khoi
 */
public class Constants {
    //"192542612754-a31982s55etlpeb7liogh8d3s66pms6e.apps.googleusercontent.com"
    public static String GOOGLE_CLIENT_ID = "292534222114-jqbb85po67c77jmb7e648o095mcqp0n6.apps.googleusercontent.com";

	public static String GOOGLE_CLIENT_SECRET = "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";

	public static String GOOGLE_REDIRECT_URI = "http://localhost:8084/booking/user/loginGoogle.do";

	public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

	public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

	public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
