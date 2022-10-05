<!DOCTYPE html>
<html lang="en">

<head>
    <title>Register User</title>
    <link rel="stylesheet" href="./style/styleform.css">

</head>

<body>
    <%@include file="Header.jsp" %>
        <center>
            <h1 style="margin: 40px 0px; ">Create User Account</h1>
        </center>
        <div class="loginform">
            <form method="post" action="CreateAccountBackend.jsp">
                <table>
                    <tr>
                        <td>
                            userId:
                        </td>
                        <td>
                            <input type="text" class="textbox" name="userId" placeholder="enter your user id">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            password:
                        </td>
                        <td>
                            <input type="password" class="textbox" name="password" placeholder="enter password">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Re enter password:
                        </td>
                        <td>
                            <input type="password" name="repassword" class="textbox" placeholder="re enter password">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Select Type:
                        </td>
                        <td>
                            <select name="type">
                                <option selected>Select</option>
                                <option value="user">User</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" class="button" value="Create">

                        </td>
                        <td>
                            <input type="reset" class="button" value="Reset">
                        </td>
                    </tr>
                </table>

            </form>
        </div>
</body>

</html>