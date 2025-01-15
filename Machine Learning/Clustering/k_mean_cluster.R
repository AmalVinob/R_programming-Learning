a <- list(c(1,2),c(2,3), c(4,5), c(5,6), c(7,8))
a
for(i in a){
  print(i)
}
length(a)*2

k <- 3
a[1],a[2],a[3]
for(i in 1:(length(a)*2)){
  for(j in 1:k){
    z <- eucledien()
  }
}

eucledien <-function(vec1, vec2){
  return(sqrt(sum((vec1 - vec2)^2))
}
vec1 <-c(1,2,3)
vec2 <- c(2,3,4)
z <-eucledien(vec1, vec2)
z






1st_stage of k_means
-------------------------------------------
  
a <- list(c(1,2),c(2,3), c(4,5), c(5,6), c(7,8))
a
eucledien <-function(x, y){
  return(sqrt(sum((x - y)^2)))
}

k <- 3
max_ <- 0
for(i in 1:(length(a))) {
  for(j in 1:(length(a))) {
    if (i != j) {
      dis <- eucledien(a[[i]], a[[j]])
      if(dis > max_) {
        max_ <- dis
      }
    }
  }
}
print(max_)

K_means_cluster <-function(a, max_){
  ck <- list(a[[1]],a[[2]],a[[3]])
  clusters <- rep(0, length(a))
  
  for(i in 1:length(a)){
    min<-max_
    cluster<-0
    
    for(j in 1:length(ck)){
      distance <- eucledien(a[[i]],ck[[j]])
      
      if(distance<min){
        min <- distance
        cluster<-j
      }
      
    }
    clusters[i]<-cluster
  }
  return(clusters)
}



cluster <- K_means_cluster(a, max_)
print(cluster)




#2nd_stage of kmeans
#--------------------------


K_means_cluster <-function(a, max_, itration){
  ck <- list(a[[1]],a[[2]],a[[3]])
  clusters <- rep(0, length(a))
  
  
  for(k in 1:itration){
    c1 <-list()
    c2 <- list()
    c3 <-list()
    
    for(i in 1:length(a)){
      min<-max_
      cluster<-0
      
      for(j in 1:length(ck)){
        distance <- eucledien(a[[i]],ck[[j]])
        
        if(distance<min){
          min <- distance
          cluster<-j
        }
        
      }
      clusters[i]<-cluster
      
      if(cluster == 1){
        c1<-append(c1,a[i])
      }
      else if(cluster == 2){
        c2<-append(c2,a[i])
      }
      else{
        c3<-append(c3, a[i])
      }
    }
    
    if(length(c1)>0){
      ck[[1]]<-update_centroid(c1)
    }
    
    if(length(c2)>0){
      ck[[2]]<-update_centroid(c2)
    }
    
    if(length(c3)>0){
      ck[[3]]<-update_centroid(c3)
    }
  }
  print(ck)
  return(clusters)
}

update_centroid<-function(ck){
  mean_first_elements <- mean(sapply(ck, function(x) x[1]))
  mean_second_elements <- mean(sapply(ck, function(x) x[2]))
  mean_ck <- c(mean_first_elements, mean_second_elements)
  return (mean_ck)
}


cluster <- K_means_cluster(a, max_, 10)
print(cluster)








#final_kmeans algorithm
#--------------------------------------

a <- list(c(1,2),c(2,3), c(4,5), c(5,6), c(7,8))
a
eucledien <-function(x, y){
  return(sqrt(sum((x - y)^2)))
}

k <- 3
max_ <- 0
for(i in 1:(length(a))) {
  for(j in 1:(length(a))) {
    if (i != j) {
      dis <- eucledien(a[[i]], a[[j]])
      if(dis > max_) {
        max_ <- dis
      }
    }
  }
}
print(max_)

K_means_cluster <-function(a, max_, itration, ck){
  ck <- ck
  clusters <- rep(0, length(a))
  
  
  for(k in 1:itration){
    c1 <-list()
    c2 <- list()
    c3 <-list()
    
    for(i in 1:length(a)){
      min<-max_
      cluster<-0
      
      for(j in 1:length(ck)){
        distance <- eucledien(a[[i]],ck[[j]])
        
        if(distance<min){
          min <- distance
          cluster<-j
        }
        
      }
      clusters[i]<-cluster
      
      if(cluster == 1){
        c1<-append(c1,a[i])
      }
      else if(cluster == 2){
        c2<-append(c2,a[i])
      }
      else{
        c3<-append(c3, a[i])
      }
    }
    
    if(length(c1)>0){
      ck[[1]]<-update_centroid(c1)
    }
    
    if(length(c2)>0){
      ck[[2]]<-update_centroid(c2)
    }
    
    if(length(c3)>0){
      ck[[3]]<-update_centroid(c3)
    }
  }
  print(ck)
  return(clusters)
}

update_centroid<-function(ck){
  mean_first_elements <- mean(sapply(ck, function(x) x[1]))
  
  mean_second_elements <- mean(sapply(ck, function(x) x[2]))
  
  mean_ck <- c(mean_first_elements, mean_second_elements)
  return (mean_ck)
}



cluster <- K_means_cluster(a, max_, 10, ck)
print(cluster)

a <- list(c(1, 2), c(2, 3), c(4, 5), c(5, 6), c(7, 8))
ck <- list(c(1, 2), c(4, 5), c(7, 8))










