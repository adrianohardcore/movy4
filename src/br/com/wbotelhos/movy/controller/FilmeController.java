package br.com.wbotelhos.movy.controller;

import static org.hamcrest.Matchers.is;import static org.hamcrest.Matchers.lessThan;
import static org.hamcrest.Matchers.notNullValue;

import java.io.File;
import java.util.Calendar;
import java.util.Collection;

import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.core.Localization;
import br.com.caelum.vraptor.interceptor.download.Download;
import br.com.caelum.vraptor.interceptor.download.FileDownload;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.validator.Validations;
import br.com.caelum.vraptor.view.Results;
import br.com.wbotelhos.movy.model.Filme;
import br.com.wbotelhos.movy.model.common.EntityWrapper;
import br.com.wbotelhos.movy.repository.ArtistaRepository;
import br.com.wbotelhos.movy.repository.FilmeRepository;

@Resource
public class FilmeController {

	private final FilmeRepository repository;
	private final Result result;
	private final Validator validator;
	private final Localization localization;
	public FilmeController(Result result, FilmeRepository repository, Validator validator, Localization localization , ArtistaRepository artistaRepository) {
		this.result = result;
		this.repository = repository;
		this.validator = validator;
		this.localization = localization;
	}

	@Get("/filme/{filme.id}/imagem")
	public Download downloadImage(Filme filme) {
		filme = repository.loadById(filme.getId());

		File file = new File(Filme.IMAGE_PATH, filme.getImagem());

	    if (!file.exists()) {
	        return new FileDownload(new File(Filme.IMAGE_PATH, "default.jpg"), "image/jpg", "default.jpg");
	    }

	    String fileName = filme.getTitulo().replaceAll(" ", "-") + ".jpg";

	    return new FileDownload(file, "image/jpg", fileName);
	}

	@Get("/filme/{filme.id}/editar")
	public void editar(Filme filme) {
	  filme = repository.loadById(filme.getId());

	  result.include("filme", filme).forwardTo(this).novo();
	}

	@Get("/filme/{filme.id}")
	public void exibir(Filme filme) {
		filme = repository.loadById(filme.getId());

		result.include("filme", filme);
	}

	@Post("/filme/{filme.id}/imagem")
	public void uploadImage(UploadedFile file, Filme filme) {
		validator.onErrorRedirectTo(this).exibir(filme);

		try {
			repository.uploadImage(file, filme);
		} catch (Exception e) {
			result.include("error", e.getMessage());
		}

		result.redirectTo(this).exibir(filme);
	}

	@Get("/filme")
	public void listagem() {

	}

	@Get("/filme/gridy")
	public void listByFilter(String search, int page, String sortName, String sortOrder, String find, int rows) {
		Collection<Filme> filmeList = repository.listByFilter(search, page, sortName, sortOrder, find, rows);

		int total = repository.countByFilter(search, find);

		EntityWrapper<Filme> wrapper = new EntityWrapper<Filme>();
		wrapper.setEntityList(filmeList);
		wrapper.setTotal(total);

		result.use(Results.json()).withoutRoot().from(wrapper)
		.include("entityList")
		.serialize();
	}

	@Get("/filme/novo")
	public void novo() {

	}

	@Delete("/filme/{filme.id}")
	public void remover(Filme filme) {
	  repository.remove(filme);

	  result
	  .include("message", "Filme removido com sucesso!")
	  .redirectTo(this).listagem();
	}

	@Delete("/filme/{filme.id}/imagem")
	public void removeImage(Filme filme) {
		try {
			filme = repository.loadById(filme.getId());

			repository.removeImage(filme);
		} catch (Exception e) {
			result.include("error", e.getMessage());
		}

		result.redirectTo(this).exibir(filme);
	}

	@Post("/filme")
	public void salvar(final Filme filme) {
		validator.validate(filme);

		validator.checking(new Validations(localization.getBundle()) {{
			if (that(filme, is(notNullValue()), "filme", "filme.nulo")) {
				final int anoAtual = Calendar.getInstance().get(Calendar.YEAR);

				that(filme.getAno(), lessThan(anoAtual), i18n("ano"), "deve.ser.menor.que", i18n("ano"), String.valueOf(anoAtual));
			}
	    }});

		validator.onErrorUsePageOf(this).novo();

		if (filme.getId() == null) {
			filme.setImagem("default.jpg");
		}
		repository.save(filme);
		result
		.include("message", "Filme salvo com sucesso!").redirectTo(this).listagem();
		//.redirectTo(this).exibir(filme);
	}

}