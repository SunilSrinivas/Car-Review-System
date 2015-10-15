<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ page import="com.ikramu.javaee.dbms_project.DatabaseInteraction" %>

<%
    final String TABLE_MEMBER = "Member";
    final String TABLE_CAR = "Car";
    final String TABLE_RATING = "Member_gives_rating_to_Review";
    final String TABLE_REVIEW = "Review";

    final String METHOD_INSERT = "Insert";
    final String METHOD_DELETE = "Delete";
    final String METHOD_UPDATE = "Update";

    String table = request.getParameter("table");
    String method = request.getParameter("method");

    StringBuilder query = new StringBuilder();

    if (method.equals(METHOD_INSERT)) {
        query.append("insert into ").append(table).append(" values(");

        if (table.equals(TABLE_MEMBER)) {
            query.append("'").append(request.getParameter("username")).append("'").append(",");
            query.append("'").append(request.getParameter("email")).append("'").append(",");
            query.append("'").append(request.getParameter("age")).append("'").append(",");
            query.append("'").append(request.getParameter("gender")).append("'").append(",");
            query.append("'").append(request.getParameter("city")).append("'").append(",");
            query.append("'").append(request.getParameter("state")).append("'");
        } else if (table.equals(TABLE_CAR)) {
            query.append("'").append(request.getParameter("manufacture")).append("'").append(",");
            query.append("'").append(request.getParameter("model")).append("'").append(",");
            query.append("'").append(request.getParameter("make")).append("'").append(",");
            query.append("'").append(request.getParameter("year")).append("'");
        } else if (table.equals(TABLE_RATING)) {
            query.append("'").append(request.getParameter("username")).append("'").append(",");
            query.append("'").append(request.getParameter("reviewID")).append("'").append(",");
            query.append("'").append(request.getParameter("rating")).append("'");
        }

        query.append(")");
    } else if (method.equals(METHOD_DELETE)) {
        query.append("delete from ").append(table).append(" where ");

        if (table.equals(TABLE_MEMBER)) {
            query.append("username=").
                    append("'").append(request.getParameter("username")).append("'");
        } else if (table.equals(TABLE_CAR)) {
            query.append("model=").append("'").append(request.getParameter("model")).append("'")
                    .append(" and ");
            query.append("make=").append("'").append(request.getParameter("make")).append("'")
                    .append(" and ");
            query.append("year=").append("'").append(request.getParameter("year")).append("'");
        } else if (table.equals(TABLE_RATING)) {
            query.append("username=").append("'").
                    append(request.getParameter("username")).append("'").append(" and ");
            query.append("reviewID=").
                    append("'").append(request.getParameter("reviewID")).append("'");
        } else if (table.equals(TABLE_REVIEW)) {
            query.append("reviewID=").
                    append("'").append(request.getParameter("reviewID")).append("'");
        }
    } else if (method.equals(METHOD_UPDATE)) {
        query.append("update ").append(table).append(" set ");

        if (table.equals(TABLE_MEMBER)) {
            query.append("email=").
                    append("'").append(request.getParameter("email")).append("'").append(",");
            query.append("age=").
                    append("'").append(request.getParameter("age")).append("'").append(",");
            query.append("gender=").
                    append("'").append(request.getParameter("gender")).append("'").append(",");
            query.append("city=").
                    append("'").append(request.getParameter("city")).append("'").append(",");
            query.append("state=").
                    append("'").append(request.getParameter("state")).append("'");

            query.append(" where ");
            query.append("username=").
                    append("'").append(request.getParameter("username")).append("'");
        } else if (table.equals(TABLE_CAR)) {
            query.append("manufacture=").
                    append("'").append(request.getParameter("manufacture")).append("'");

            query.append(" where ");
            query.append("model=").append("'").append(request.getParameter("model")).append("'")
                    .append(" and ");
            query.append("make=").append("'").append(request.getParameter("make")).append("'")
                    .append(" and ");
            query.append("year=").append("'").append(request.getParameter("year")).append("'");
        } else if (table.equals(TABLE_RATING)) {
            query.append("rating=").
                    append("'").append(request.getParameter("rating")).append("'");

            query.append(" where ");
            query.append("username=").append("'").
                    append(request.getParameter("username")).append("'").append(" and ");
            query.append("reviewID=").
                    append("'").append(request.getParameter("reviewID")).append("'");
        } else if (table.equals(TABLE_REVIEW)) {
            query.append("reviewDescription=").
                    append("'").append(request.getParameter("reviewDescription")).append("'");

            query.append(" where ");
            query.append("reviewID=").
                    append("'").append(request.getParameter("reviewID")).append("'");
        }
    }

    if (DatabaseInteraction.getInstance().executeUpdate(query.toString()) > 0)
        out.print("Database Modified Successfully");
    else
        out.print("Unsuccessful");
    out.flush();

    try {
        Thread.sleep(3000);
    } catch (InterruptedException ignored) {
    }
%>

<script language="javascript">
    window.history.back();
</script>