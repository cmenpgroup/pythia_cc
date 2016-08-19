#ifndef readoptfile_hh
#define readoptfile_hh 1

#include "cpp_headers.hh"

class ReadOptFile
{
 public:
  ReadOptFile();
  ~ReadOptFile();
  int read_optfile();
  void dump_optfile();
  int getStatus();

  string optfile;

  int    fLtype;
  double fEe;
  int    fNevts;
  int    fAt;
  int    fZt;
  int    fNevtsPerNtp;
  double fQ2lo;
  double fQ2hi;
  vector<int> fPartList;
  vector<int> fPartQty;
 
  ReadOptFile & operator=(const ReadOptFile &rhs);

 private:
  int status;
};

extern ReadOptFile *rof;

#endif
