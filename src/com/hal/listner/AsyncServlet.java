package com.hal.listner;

import java.io.IOException;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hal.dao.Dao;
import com.hal.dao.UserDao;

/**
 * Servlet implementation class AsyncServlet
 */
@WebServlet("/AsyncServlet")
public class AsyncServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsyncServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao userDao = UserDao.getInstance();
		final AsyncContext asyncContext = request.startAsync(request, response);
        asyncContext.setTimeout(100);
        asyncContext.addListener(new AsyncListener() {
            @Override
            public void onComplete(AsyncEvent asyncEvent) throws IOException {
                System.out.println("AsyncServlet.onComplete");
                System.out.println("asyncEvent = [" + asyncEvent + "]");
            }

            @Override
            public void onTimeout(AsyncEvent asyncEvent) throws IOException {
                System.out.println("AsyncServlet.onTimeout");
                System.out.println("asyncEvent = [" + asyncEvent + "]");
            }

            @Override
            public void onError(AsyncEvent asyncEvent) throws IOException {
                System.out.println("AsyncServlet.onError");
                System.out.println("asyncEvent = [" + asyncEvent + "]");
            }

            @Override
            public void onStartAsync(AsyncEvent asyncEvent) throws IOException {
                System.out.println("AsyncServlet.onStartAsync");
                System.out.println("asyncEvent = [" + asyncEvent + "]");
            }
        });
        asyncContext.start(() -> System.out.println("async"));
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        asyncContext.complete();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
