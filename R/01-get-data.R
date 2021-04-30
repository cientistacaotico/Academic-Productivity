
# Variaveis ---------------------------------------------------------------

# analise da proporcao de docentes doutores
# tempo de atuacao: a partir do mestrado
# numero de artigos publicados: a partir do mestrado
# numero de orientacoes
# colaborações****
# linhas de pesquisa
# linha de pesquisa de formação
# numero de projetos de extensao
# visibilidade (exemplo: apresentacao de trabalho) conferencias
# avaliar se docentes que publicam mais em ingles tem reconhecimento internacional por meio de conferencias (internacional)

### Universidade

# colaboracao interna ou externa
# tempo de vida do curso
# localizacao geográfica com as publicacoes

# Fazer avaliação posteriori se ter programa de pós ajuda
# na produtividade dos professores. Atribuir pesos para 
# cursos só com graduação; graduação e mestrado; graduação, mestrado e doutorado

# obtendo dados -----------------------------------------------------------

dir <- list.dirs("./Data")[-1]
folders <- list.files("./Data")
cv <- list()

n <- as.numeric()
for (m in 1:length(dir)) {
  n[m] <- length(list.files(dir[m]))
  num.row <- sum(n)
}; rm(n)
c.names <- c("universidade", "pais.origem", "bsc.inicio.ano", "bsc.fim.ano", "msc.inicio.year", "msc.fim.year", "phd.inicio.year", 
             "phd.fim.year", "n.publicacao", "n.aceitos", "n.supervisoes", "n.conferencias")
num.col <- length(c.names)

df <- as.data.frame(matrix(ncol = num.col, nrow = num.row))
colnames(df) <- c.names

for (i in 1:length(dir)) {
  files <- list.files(dir[i])
  if (i == 1){
    for (j in 1:length(files)) {
      end <- paste(dir[i],files[j], sep = "/")
      cv[[j]] <- gld_read_zip(end)
      df[j,1] <- folders[i]
      df[j,2] <- ifelse(is.null(cv[[j]][["tpesq"]][["country.origin"]]), NA, cv[[j]][["tpesq"]][["country.origin"]])
      df[j,3] <- ifelse(is.null(cv[[j]][["tpesq"]][["bsc.start.year"]]), NA, cv[[j]][["tpesq"]][["bsc.start.year"]])
      df[j,4] <- ifelse(is.null(cv[[j]][["tpesq"]][["bsc.end.year"]]), NA, cv[[j]][["tpesq"]][["bsc.end.year"]])
      df[j,5] <- ifelse(is.null(cv[[j]][["tpesq"]][["msc.start.year"]]), NA, cv[[j]][["tpesq"]][["msc.start.year"]])
      df[j,6] <- ifelse(is.null(cv[[j]][["tpesq"]][["msc.end.year"]]), NA, cv[[j]][["tpesq"]][["msc.end.year"]])
      df[j,7] <- ifelse(is.null(cv[[j]][["tpesq"]][["phd.start.year"]]), NA, cv[[j]][["tpesq"]][["phd.start.year"]])
      df[j,8] <- ifelse(is.null(cv[[j]][["tpesq"]][["phd.end.year"]]), NA, cv[[j]][["tpesq"]][["phd.end.year"]])
      df[j,9] <- ifelse(is.null(dim(cv[[j]][["tpublic.published"]])[1]), NA, dim(cv[[j]][["tpublic.published"]])[1])
      df[j,10] <- ifelse(is.null(dim(cv[[j]][["tpublic.accepted"]])[1]), NA, dim(cv[[j]][["tpublic.accepted"]])[1])
      df[j,11] <- ifelse(is.null(dim(cv[[j]][["tsupervisions"]])[1]), NA, dim(cv[[j]][["tsupervisions"]])[1])
      df[j,12] <- ifelse(is.null(dim(cv[[j]][["tconferences"]])[1]), NA, dim(cv[[j]][["tconferences"]])[1])
    }
  }
  if (i != 1) {
    for (k in 2:i) {
      n <- ifelse(k == 2, length(list.files(dir[1])), sum(length(list.files(dir[k-1])), n))
    }
    for (j in 1:length(files)) {
      end <- paste(dir[i],files[j], sep = "/")
      cv[[n+j]] <- gld_read_zip(end)
      df[n+j,1] <- folders[i]
      df[n+j,2] <- ifelse(is.null(cv[[n+j]][["tpesq"]][["country.origin"]]), NA, cv[[n+j]][["tpesq"]][["country.origin"]])
      df[n+j,3] <- ifelse(is.null(cv[[n+j]][["tpesq"]][["bsc.start.year"]]), NA, cv[[n+j]][["tpesq"]][["bsc.start.year"]])
      df[n+j,4] <- ifelse(is.null(cv[[n+j]][["tpesq"]][["bsc.end.year"]]), NA, cv[[n+j]][["tpesq"]][["bsc.end.year"]])
      df[n+j,5] <- ifelse(is.null(cv[[n+j]][["tpesq"]][["msc.start.year"]]), NA, cv[[n+j]][["tpesq"]][["msc.start.year"]])
      df[n+j,6] <- ifelse(is.null(cv[[n+j]][["tpesq"]][["msc.end.year"]]), NA, cv[[n+j]][["tpesq"]][["msc.end.year"]])
      df[n+j,7] <- ifelse(is.null(cv[[n+j]][["tpesq"]][["phd.start.year"]]), NA, cv[[n+j]][["tpesq"]][["phd.start.year"]])
      df[n+j,8] <- ifelse(is.null(cv[[n+j]][["tpesq"]][["phd.end.year"]]), NA, cv[[n+j]][["tpesq"]][["phd.end.year"]])
      df[n+j,9] <- ifelse(is.null(dim(cv[[n+j]][["tpublic.published"]])[1]), NA, dim(cv[[n+j]][["tpublic.published"]])[1])
      df[n+j,10] <- ifelse(is.null(dim(cv[[n+j]][["tpublic.accepted"]])[1]), NA, dim(cv[[n+j]][["tpublic.accepted"]])[1])
      df[n+j,11] <- ifelse(is.null(dim(cv[[n+j]][["tsupervisions"]])[1]), NA, dim(cv[[n+j]][["tsupervisions"]])[1])
      df[n+j,12] <- ifelse(is.null(dim(cv[[n+j]][["tconferences"]])[1]), NA, dim(cv[[n+j]][["tconferences"]])[1])
    }
  }
}; rm(c.names,dir,end,files,folders,i,j,k,m,n,num.col,num.row)

# coletar o número de artigos publicados e aceitos em lingua inglesa: usar table
# coletar cv[[1]][["tconferences"]][["event.classification"]]
