<head>
	<title>Movy | Usu&aacute;rio [novo]</title>
</head>
<body>
	<fieldset style="width: 390px;">
		<legend>Usu&aacute;rio</legend>

		<form action="${pageContext.request.contextPath}/usuario" method="post">
			<input type="hidden" name="usuario.id" value="${usuario.id}"/>

			<label>Nome:</label>
			<input type="text" name="usuario.nome" value="${usuario.nome}"/><br/>

			<label>E-mail:</label>
			<input type="text" name="usuario.email" value="${usuario.email}"/><br/>
			
			<label>Perfil:</label>
			<select name="usuario.perfil">
			    <option value="" selected="selected">--selecione--</option>
			    <c:forEach items="${tipoPerfilList}" var="perfil">
					<option value="${perfil}"
						<c:if test="${usuario.perfil eq perfil}">selected="selected"</c:if>>${perfil.label}</option>
				</c:forEach>
			</select><br/><br/>
			

			<label>Senha:</label>
			<input type="text" name="usuario.senha" value="${usuario.senha}"/><br/>

			<input type="submit" value="salvar"/>
		</form>
	</fieldset>
</body>