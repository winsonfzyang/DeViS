# library(forestplot)
library(forestplot)
data(HRQoL)


# Prepare a new matrix as a list
creatmat <- function(dflist){
  for (i in names(dflist)){
    df_1 <- as.matrix(data.frame(dflist[i]))
    df_2 <- rbind(rep(NA,times=ncol(df_1)), 
          df_1)
    colnames(df_2) <- c("coef","lower","upper")
    rownames(df_2)[1] <- "Variable"
    dflist[[i]] <- df_2
  }
  print(dflist)
}
mylist <- creatmat(HRQoL)

# Bind to df
grouplist <- c("Sweden","Denmark")

bindvar <- function(mylist,coeflowerupper){
  binddf <- vector("list", length(mylist))
  for (i in 1:length(mylist)){
    ddf <- as.matrix(data.frame(mylist[i]))
    colnames(ddf) <- c("coef","lower","upper")
    binddf[[i]] <- ddf[,coeflowerupper]
    }
  binded <- do.call(cbind, binddf)
  binded
}

df_mean <- bindvar(mylist,"coef")
df_lower <- bindvar(mylist,"lower")
df_upper <- bindvar(mylist,"upper")


# Create the matrix
matrx <- function(mylist){
  lab_mat <- vector("list", length(mylist))
  for (i in 1:length(mylist)){
    ddf <- as.matrix(data.frame(mylist[i]))
    colnames(ddf) <- c("coef","lower","upper")
    lab_mat[[i]] <- cbind(append("Est.", 
                                 round(ddf[,"coef"],3)[2:5]))
  }
  binded <- do.call(cbind, lab_mat)
  rownames(binded)[1] <- "Variable"
  newbind <- cbind(rownames(binded),binded)
  colnames(newbind) <- c("",names(mylist))
  newbind
}

labmatrix <- matrx(mylist)


plot_list <- list()
plot_list$mean <- bindvar(mylist,"coef")
plot_list$lower <- bindvar(mylist,"lower")
plot_list$upper <- bindvar(mylist,"upper")
plot_list$legend <- names(mylist)
plot_list$labeltext <- matrx(mylist)


p <- forestplot(mean=plot_list$mean, 
           lower=plot_list$lower, 
           upper=plot_list$upper,
           # Labels
           title = "Forest plot of effect sizes",
           xlab="Regression Coefficients",
           labeltext=plot_list$labeltext, 
           # Add legend
           legend=plot_list$legend, 
           legend.pos=list("topleft"), 
           legend.r=unit(.2, "npc"), 
           legend.gp=gpar(col="grey", fill="#FAFAFF"),
           col=fpColors(box=c("darkred", "blue"),
                        line=c("darkred", "blue")),
           # Size of graph
           clip=c(-.15, .1), 
           boxsize=0.15,
           new_page=TRUE)
