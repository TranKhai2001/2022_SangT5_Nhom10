<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% int count = Integer.parseInt(request.getAttribute("count").toString());%>
<c:forEach var="node" items="${node.children()}">
    <%count++;%>
    <div class="comment-resposes">
                                                <ol class="post-comments lever-1">
                                                    <li class="comment-elem">
                                                        <div class="wrap-post-comment">
                                                            <div class="cmt-inner">
                                                                <div class="auth-info">
                                                                    <a href="#" class="author-contact"><img src="assets/images/blogpost/author-03.png" alt="" width="29" height="28">@<b style="color:green;">${node.getParent+" "}</b>${node.getId_user()}<</a>
                                                                    <span class="cmt-time">${node.getDate_post().toString()}</span>
                                                                </div>
                                                                <div class="cmt-content">
                                                                    <p>${node.getComment_content()}</p>
                                                                </div>
                                                                <div class="cmt-fooot">
                                                                    <a type="button" onclick="runme(<%=count%>)" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>
                                                                </div>
                                                                <form action="AddCommentBlog" method="post" id="<%=count%>" hidden >
                                                                    <textarea type="text" name="message" rows="4" cols="50"></textarea>
                                                                    <input type="hidden" name="father_id_blog" value="${node.getId_comment_blog()}">
                                                                    <input type="hidden" name="id_blog" value="${node.getId_blog()}">
                                                                    <button type="submit" value="send response"> gửi phản hồi</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </div>
    <c:set var="node" value="${node}" scope="request"/>
    <%request.setAttribute("count",count);%>
    <jsp:forward page="ChildCommentBlog.jsp"/>
</c:forEach>
