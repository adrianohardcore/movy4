
<body>

	<form action="${pageContext.request.contextPath}/filme" method="post">
		<fieldset style="width: 300px;">


			<input type="hidden" name="filme.id" value="${filme.id}" /> <label>T&iacute;tulo:</label>
			<input type="text" name="filme.titulo" value="${filme.titulo}" /><br />

			<label>T&iacute;tulo Original:</label> <input type="text"
				name="filme.tituloOriginal" value="${filme.tituloOriginal}" /><br />

			<label>Ano:</label> <input type="text" name="filme.ano"
				value="${filme.ano}" /><br /> <label>G&ecirc;nero:</label> <input
				type="text" name="filme.genero" value="${filme.genero}" /><br /> <label>Sinopse:</label>
			<textarea rows="6" cols="45" name="filme.sinopse">${filme.sinopse}</textarea>
			<br />
			<br />


		</fieldset>

		<fieldset id="artista-container" style="width: 300px;">
			<legend>
				Artistas 			
				
				<img src="<c:url value='/img/add.png'/>" alt="+" onclick="adicionarArtista();" />		
				
			</legend>

			<c:forEach items="${filme.artistas}" var="item" varStatus="status">
				<div data-index="${status.index}" class="artista-item">
					<label>Nome:</label> <input type="text"
						name="filme.artistas[${status.index}].nome" value="${item.nome}" />
					<img src="<c:url value='/img/remover.png'/>" alt="-" class="btn-remover-ator" />
				</div>
			</c:forEach>
		</fieldset>
		<br /> <input type="submit" value="Salvar" />
	</form>

	<script type="text/javascript">
			$('.btn-remover-ator').live('click', function() {
				$(this).parent().remove();
			});
	
			function adicionarArtista() {
				var $container	= $('#artista-container'),
					$artistas	= $container.children('.artista-item'),
					firstIndex	= $artistas.first().data('index'),
					lastIndex	= $artistas.last().data('index');

				if (firstIndex === undefined) {
					firstIndex = 0;
					lastIndex = 0;
				}

				var index = parseInt(firstIndex) + parseInt(lastIndex) + 1;

				$('<div class="artista-item">' +
					'<label>Nome:</label>' +
					'<input type="text" name="filme.artistas[' + index + '].nome" value="${item.nome}"/>' +
					'<img src=\'<c:url value="/img/remover.png"/>\' alt="-" class="btn-remover-ator"/>' +
				'</div>')
				.data('index', index)
				.appendTo($container);
			};
		</script>
</body>







<!-- <body> -->
<!-- 	<fieldset style="width: 390px;"> -->
<!-- 		<legend>Filme</legend> -->

<%-- 		<form action="${pageContext.request.contextPath}/filme" method="post"> --%>
<%-- 			<input type="hidden" name="filme.id" value="${filme.id}"/> --%>

<!-- 			<label>T&iacute;tulo:</label> -->
<%-- 			<input type="text" name="filme.titulo" value="${filme.titulo}"/><br/> --%>

<!-- 			<label>T&iacute;tulo Original:</label> -->
<%-- 			<input type="text" name="filme.tituloOriginal" value="${filme.tituloOriginal}"/><br/> --%>

<!-- 			<label>Ano:</label> -->
<%-- 			<input type="text" name="filme.ano" value="${filme.ano}"/><br/> --%>

<!-- 			<label>G&ecirc;nero:</label> -->
<%-- 			<input type="text" name="filme.genero" value="${filme.genero}"/><br/> --%>

<!-- 			<label>Sinopse:</label> -->
<%-- 			<textarea rows="6" cols="45" name="filme.sinopse">${filme.sinopse}</textarea><br/><br/> --%>

<!-- 			<input type="submit" value="salvar"/> -->
<!-- 		</form> -->
<!-- 	</fieldset> -->
<!-- </body> -->