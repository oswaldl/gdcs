<%@ page import="com.zy.vo.UserDrugRelation" %>

<table>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'username', 'error')} ">用户名：</td>
    <td>${userDrugRelationInstance?.username}</td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'geneData', 'error')} ">
    	基因数据&nbsp;&nbsp;<g:link controller="userDrugRelation" action="editDesc" params='[userDrugRelationId:"${userDrugRelationInstance?.id }",type:"geneData"]'>编辑</g:link></td>
    <td><g:textArea name="geneData" cols="40" rows="5" maxlength="3000" value="${userDrugRelationInstance?.geneData}"/></td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'oddRatio', 'error')} ">
    	技术报告&nbsp;&nbsp;<g:link controller="userDrugRelation" action="editDesc" params='[userDrugRelationId:"${userDrugRelationInstance?.id }",type:"oddRatio"]'>编辑</g:link></td>
    <td><g:textArea name="oddRatio" cols="40" rows="5" maxlength="3000" value="${userDrugRelationInstance?.oddRatio}"/></td>
  </tr>
<%--  <tr>--%>
<%--    <td class="fieldcontain ${hasErrors(bean: userDrugRelationInstance, field: 'geneAbstract', 'error')} ">--%>
<%--    	基因摘要&nbsp;&nbsp;<g:link controller="userDrugRelation" action="editDesc" params='[userDrugRelationId:"${userDrugRelationInstance?.id }",type:"geneAbstract"]'>编辑</g:link></td>--%>
<%--    <td><g:textArea name="geneAbstract" cols="40" rows="5" maxlength="3000" value="${userDrugRelationInstance?.geneAbstract}"/></td>--%>
<%--  </tr>--%>
</table>

