
## This Makefile copied from Ott Toomet
## comment this out if you need a different version of R, 
## and set set R_HOME accordingly as an environment variable
R_HOME := 		$(shell R RHOME)

## include headers and libraries for R 
RCPPFLAGS := 		$(shell $(R_HOME)/bin/R CMD config --cppflags) -fopenmp \
			$(RCPPARMADILLO)
RLDFLAGS := 		$(shell $(R_HOME)/bin/R CMD config --ldflags)

## include headers and libraries for Rcpp interface classes
RCPPINCL := 		$(shell echo 'Rcpp:::CxxFlags()' | \
			$(R_HOME)/bin/R --vanilla --slave)
RCPPLIBS := 		$(shell echo 'Rcpp:::LdFlags()'  | \
			$(R_HOME)/bin/R --vanilla --slave)

cpp_sources := 		$(wildcard *.cpp)
cpp_sos :=		$(patsubst %.cpp,%.so,$(cpp_sources))

all :			$(cpp_sos)

$(cpp_sos):		%.so: %.cpp
			rm -f $@ $(patsubst %.so,%.o,$@)
			PKG_CPPFLAGS="$(RCPPFLAGS) $(RCPPINCL)" \
			PKG_LIBS="$(RLDFLAGS) $(RCPPLIBS)" R CMD SHLIB $<

clean:			
			rm $(cpp_sos)
