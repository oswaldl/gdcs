package com.zy.gdcs.webmagic;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class TestSave {

	public void testPostRequest() throws HttpException, IOException {  
        HttpClient client = new HttpClient();  
        PostMethod method = new PostMethod("http://localhost:8080/gdcs/crawlRecord/createCrawlRecord");  
        method.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
        NameValuePair[] param = { new NameValuePair("username", "11"),
                new NameValuePair("url1", "jay"), new NameValuePair("url2", "jay")};
        method.setRequestBody(param);
        int statusCode = client.executeMethod(method);
        System.out.println(statusCode);
        method.releaseConnection();  
    }
	
	public void readContentFromPost() throws IOException {
        // Post请求的url，与get不同的是不需要带参数
        URL postUrl = new URL("http://localhost:8080/gdcs/crawlRecord/createCrawlRecord");
        // 打开连接
        HttpURLConnection connection = (HttpURLConnection) postUrl
                .openConnection();
        // Output to the connection. Default is false, set to true because post method must write something to the connection
        // 设置是否向connection输出，因为这个是post请求，参数要放在
        // http正文内，因此需要设为true
        connection.setDoOutput(true);
        // Read from the connection. Default is true.
        connection.setDoInput(true);
        // Set the post method. Default is GET
        connection.setRequestMethod("POST");
        // Post cannot use caches
        // Post 请求不能使用缓存
        connection.setUseCaches(false);
        // This method takes effects to every instances of this class.
        // URLConnection.setFollowRedirects是static函数，作用于所有的URLConnection对象。
        // connection.setFollowRedirects(true);

        // This methods only takes effacts to this instance.
        // URLConnection.setInstanceFollowRedirects是成员函数，仅作用于当前函数
        connection.setInstanceFollowRedirects(true);
        // Set the content type to urlencoded,because we will write some URL-encoded content to the connection. Settings above must be set before connect!
        // 配置本次连接的Content-type，配置为application/x-www-form-urlencoded的
        // 意思是正文是urlencoded编码过的form参数，下面我们可以看到我们对正文内容使用URLEncoder.encode
        // 进行编码
        connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
        // 连接，从postUrl.openConnection()至此的配置必须要在connect之前完成，
        // 要注意的是connection.getOutputStream会隐含的进行connect。
        connection.connect();
        DataOutputStream out = new DataOutputStream(connection.getOutputStream());
        // The URL-encoded contend
        // 正文，正文内容其实跟get的URL中'?'后的参数字符串一致
        String content = "username=username&url1=url1&url2=url2";
        // DataOutputStream.writeBytes将字符串中的16位的unicode字符以8位的字符形式写道流里面
        out.writeBytes(content); 

        out.flush();
        out.close(); // flush and close
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String line;
        while ((line = reader.readLine()) != null) {
            System.out.println(line);
        }
        reader.close();
        connection.disconnect();
    }
	
	public static void main(String[] args) {
//		new TestSave().readContentFromPost();
		try {
			new TestSave().testPostRequest();
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
