Source Quelle: 
https://github.com/elalish/manifold

C-Header:
https://github.com/elalish/manifold/tree/master/bindings/c/include/manifold

Source so bauen :
 cmake ../manifold/ -DMANIFOLD_EXPORT=ON



Multithareading Fähig
cmake . -DCMAKE_BUILD_TYPE=Release -DMANIFOLD_PAR=ON -DMANIFOLD_CBIND=ON -DBUILD_SHARED_LIBS=ON

