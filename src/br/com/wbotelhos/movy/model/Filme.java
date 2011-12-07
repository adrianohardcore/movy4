package br.com.wbotelhos.movy.model;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.validator.Length;
import org.hibernate.validator.NotEmpty;
import org.hibernate.validator.NotNull;

import br.com.wbotelhos.movy.model.common.AbstractEntity;

@Entity
public class Filme extends AbstractEntity {

	private static final long serialVersionUID = -8749023244978931400L;

	public static final String IMAGE_PATH = "/Users/botelho/movy/img/filme";

	private Integer ano;

	@NotNull
	@NotEmpty
	@Length(min = 3, max = 255)
	private String titulo;
	private String tituloOriginal;
	private String genero;
	private String sinopse;
	private String imagem;
	
	
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, fetch = FetchType.EAGER)	
	@JoinTable(	
			name = "FilmeArtista",	
			joinColumns = @JoinColumn(name = "filme_id"), inverseJoinColumns = @JoinColumn(name = "artista_id")	
			)	
	//private Collection<Artista> artistaList;
	private Collection<Artista> artistas;

	
	
	
	
	

	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getTituloOriginal() {
		return tituloOriginal;
	}

	public void setTituloOriginal(String tituloOriginal) {
		this.tituloOriginal = tituloOriginal;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getSinopse() {
		return sinopse;
	}

	public void setSinopse(String sinopse) {
		this.sinopse = sinopse;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}



	public Collection<Artista> getArtistas() {
		return artistas;
	}

	public void setArtistas(Collection<Artista> artistas) {
		this.artistas = artistas;
	}



}