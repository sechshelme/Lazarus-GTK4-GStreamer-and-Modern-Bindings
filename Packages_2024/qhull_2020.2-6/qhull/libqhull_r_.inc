{$IFDEF read_interface}


const
  qhDEFlibqhull = 1;

var
  qh_version : Pchar;cvar;external libqhull_r;
  qh_version2 : Pchar;cvar;external libqhull_r;

type
  TcoordT = TrealT;
  PcoordT = ^TcoordT;
  PPcoordT = ^PcoordT;

  TpointT = TcoordT;
  PpointT = ^TpointT;
  PPpointT = ^PpointT;

type
  Pqh_pointT = ^Tqh_pointT;
  Tqh_pointT = longint;

const
  qh_IDnone = -(3);
  qh_IDinterior = -(2);
  qh_IDunknown = -(1);

type
  TflagT = dword;
  TboolT = Boolean32;
  PboolT = ^TboolT;

const
  qh_False = False;
  qh_True = True;

type
  Pqh_CENTER = ^Tqh_CENTER;
  Tqh_CENTER = longint;

const
  qh_ASnone = 0;
  qh_ASvoronoi = 1;
  qh_AScentrum = 2;

type
  Pqh_PRINT = ^Tqh_PRINT;
  Tqh_PRINT = longint;

const
  qh_PRINTnone = 0;
  qh_PRINTarea = 1;
  qh_PRINTaverage = 2;
  qh_PRINTcoplanars = 3;
  qh_PRINTcentrums = 4;
  qh_PRINTfacets_ = 5;
  qh_PRINTfacets_xridge = 6;
  qh_PRINTgeom = 7;
  qh_PRINTids = 8;
  qh_PRINTinner = 9;
  qh_PRINTneighbors = 10;
  qh_PRINTnormals = 11;
  qh_PRINTouter = 12;
  qh_PRINTmaple = 13;
  qh_PRINTincidences = 14;
  qh_PRINTmathematica = 15;
  qh_PRINTmerges = 16;
  qh_PRINToff = 17;
  qh_PRINToptions = 18;
  qh_PRINTpointintersect = 19;
  qh_PRINTpointnearest = 20;
  qh_PRINTpoints_ = 21;
  qh_PRINTqhull = 22;
  qh_PRINTsize = 23;
  qh_PRINTsummary_ = 24;
  qh_PRINTtriangles = 25;
  qh_PRINTvertices_ = 26;
  qh_PRINTvneighbors_ = 27;
  qh_PRINTextremes_ = 28;
  qh_PRINTEND_ = 29;

  qh_ALL = True;
  qh_NOupper = True;
  qh_IScheckmax = True;
  qh_ISnewfacets = True;
  qh_RESETvisible = True;

  qh_ERRnone = 0;
  qh_ERRinput = 1;
  qh_ERRsingular = 2;
  qh_ERRprec = 3;
  qh_ERRmem = 4;
  qh_ERRqhull = 5;
  qh_ERRother = 6;
  qh_ERRtopology = 7;
  qh_ERRwide = 8;
  qh_ERRdebug = 9;

const
  DEFqhT = 1;
  DEFsetT = 1;

// =========== Ausgelagert

type
  TsetelemT = record
    case longint of
      0: (p: pointer);
      1: (i: longint);
  end;
  PsetelemT = ^TsetelemT;

  TsetT = record
    maxsize: longint;
    e: array[0..0] of TsetelemT;
  end;
  PsetT = ^TsetT;
  PPsetT = ^PsetT;

type
  Tqh_statistics = longint;

const
  Zacoplanar = 0;
  Wacoplanarmax = 1;
  Wacoplanartot = 2;
  Zangle = 3;
  Wangle = 4;
  Wanglemax = 5;
  Wanglemin = 6;
  Zangletests = 7;
  Wareatot = 8;
  Wareamax = 9;
  Wareamin = 10;
  Zavoidold = 11;
  Wavoidoldmax = 12;
  Wavoidoldtot = 13;
  Zback0 = 14;
  Zbestcentrum = 15;
  Zbestdist = 16;
  Zbestlower = 17;
  Zbestlowerall = 18;
  Zbestloweralln = 19;
  Zbestlowerv = 20;
  Zcentrumtests = 21;
  Zcheckpart = 22;
  Zcomputefurthest = 23;
  Zconcave = 24;
  Wconcavemax = 25;
  Wconcavetot = 26;
  Zconcavecoplanar = 27;
  Wconcavecoplanarmax = 28;
  Wconcavecoplanartot = 29;
  Zconcavecoplanarridge = 30;
  Zconcaveridge = 31;
  Zconcaveridges = 32;
  Zcoplanar = 33;
  Wcoplanarmax = 34;
  Wcoplanartot = 35;
  Zcoplanarangle = 36;
  Zcoplanarcentrum = 37;
  Zcoplanarhorizon = 38;
  Zcoplanarinside = 39;
  Zcoplanarpart = 40;
  Zcoplanarridges = 41;
  Wcpu = 42;
  Zcyclefacetmax = 43;
  Zcyclefacettot = 44;
  Zcyclehorizon = 45;
  Zcyclevertex = 46;
  Zdegen = 47;
  Wdegenmax = 48;
  Wdegentot = 49;
  Zdegenvertex = 50;
  Zdelfacetdup = 51;
  Zdelridge = 52;
  Zdelvertextot = 53;
  Zdelvertexmax = 54;
  Zdetfacetarea = 55;
  Zdetsimplex = 56;
  Zdistcheck = 57;
  Zdistconvex = 58;
  Zdistgood = 59;
  Zdistio = 60;
  Zdistplane = 61;
  Zdiststat = 62;
  Zdistvertex = 63;
  Zdistzero = 64;
  Zdoc1 = 65;
  Zdoc2 = 66;
  Zdoc3 = 67;
  Zdoc4 = 68;
  Zdoc5 = 69;
  Zdoc6 = 70;
  Zdoc7 = 71;
  Zdoc8 = 72;
  Zdoc9 = 73;
  Zdoc10 = 74;
  Zdoc11 = 75;
  Zdoc12 = 76;
  Zdropdegen = 77;
  Zdropneighbor = 78;
  Zdupflip = 79;
  Zduplicate = 80;
  Wduplicatemax = 81;
  Wduplicatetot = 82;
  Zdupsame = 83;
  Zflipped = 84;
  Wflippedmax = 85;
  Wflippedtot = 86;
  Zflippedfacets = 87;
  Zflipridge = 88;
  Zflipridge2 = 89;
  Zfindbest = 90;
  Zfindbestmax = 91;
  Zfindbesttot = 92;
  Zfindcoplanar = 93;
  Zfindfail = 94;
  Zfindhorizon = 95;
  Zfindhorizonmax = 96;
  Zfindhorizontot = 97;
  Zfindjump = 98;
  Zfindnew = 99;
  Zfindnewmax = 100;
  Zfindnewtot = 101;
  Zfindnewjump = 102;
  Zfindnewsharp = 103;
  Zgauss0 = 104;
  Zgoodfacet = 105;
  Zhashlookup = 106;
  Zhashridge = 107;
  Zhashridgetest = 108;
  Zhashtests = 109;
  Zinsidevisible = 110;
  Zintersect = 111;
  Zintersectfail = 112;
  Zintersectmax = 113;
  Zintersectnum = 114;
  Zintersecttot = 115;
  Zmaxneighbors = 116;
  Wmaxout = 117;
  Wmaxoutside = 118;
  Zmaxridges = 119;
  Zmaxvertex = 120;
  Zmaxvertices = 121;
  Zmaxvneighbors = 122;
  Zmemfacets = 123;
  Zmempoints = 124;
  Zmemridges = 125;
  Zmemvertices = 126;
  Zmergeflipdup = 127;
  Zmergehorizon = 128;
  Zmergeinittot = 129;
  Zmergeinitmax = 130;
  Zmergeinittot2 = 131;
  Zmergeintocoplanar = 132;
  Zmergeintohorizon = 133;
  Zmergenew = 134;
  Zmergesettot = 135;
  Zmergesetmax = 136;
  Zmergesettot2 = 137;
  Zmergesimplex = 138;
  Zmergevertex = 139;
  Wmindenom = 140;
  Wminvertex = 141;
  Zminnorm = 142;
  Zmultiridge = 143;
  Znearlysingular = 144;
  Zredundant = 145;
  Wnewbalance = 146;
  Wnewbalance2 = 147;
  Znewbesthorizon = 148;
  Znewfacettot = 149;
  Znewfacetmax = 150;
  Znewvertex = 151;
  Wnewvertex = 152;
  Wnewvertexmax = 153;
  Znewvertexridge = 154;
  Znoarea = 155;
  Znonsimplicial = 156;
  Znowsimplicial = 157;
  Znotgood = 158;
  Znotgoodnew = 159;
  Znotmax = 160;
  Znumfacets = 161;
  Znummergemax = 162;
  Znummergetot = 163;
  Znumneighbors = 164;
  Znumridges = 165;
  Znumvertices = 166;
  Znumvisibility = 167;
  Znumvneighbors = 168;
  Zonehorizon = 169;
  Zpartangle = 170;
  Zpartcoplanar = 171;
  Zpartcorner = 172;
  Zparthidden = 173;
  Zpartinside = 174;
  Zpartition = 175;
  Zpartitionall = 176;
  Zpartnear = 177;
  Zparttwisted = 178;
  Zpbalance = 179;
  Wpbalance = 180;
  Wpbalance2 = 181;
  Zpinchduplicate = 182;
  Zpinchedapex = 183;
  Zpinchedvertex = 184;
  Zpostfacets = 185;
  Zpremergetot = 186;
  Zprocessed = 187;
  Zremvertex = 188;
  Zremvertexdel = 189;
  Zredundantmerge = 190;
  Zrenameall = 191;
  Zrenamepinch = 192;
  Zrenameshare = 193;
  Zretry = 194;
  Wretrymax = 195;
  Zretryadd = 196;
  Zretryaddmax = 197;
  Zretryaddtot = 198;
  Zridge = 199;
  Wridge = 200;
  Wridgemax = 201;
  Zridge0 = 202;
  Wridge0 = 203;
  Wridge0max = 204;
  Zridgemid = 205;
  Wridgemid = 206;
  Wridgemidmax = 207;
  Zridgeok = 208;
  Wridgeok = 209;
  Wridgeokmax = 210;
  Zsearchpoints = 211;
  Zsetplane = 212;
  Ztestvneighbor = 213;
  Ztotcheck = 214;
  Ztothorizon = 215;
  Ztotmerge = 216;
  Ztotpartcoplanar = 217;
  Ztotpartition = 218;
  Ztotridges = 219;
  Ztotvertices = 220;
  Ztotvisible = 221;
  Ztricoplanar = 222;
  Ztricoplanarmax = 223;
  Ztricoplanartot = 224;
  Ztridegen = 225;
  Ztrimirror = 226;
  Ztrinull = 227;
  Ztwisted = 228;
  Wtwistedtot = 229;
  Wtwistedmax = 230;
  Ztwistedridge = 231;
  Zvertextests = 232;
  Wvertexmax = 233;
  Wvertexmin = 234;
  Zvertexridge = 235;
  Zvertexridgetot = 236;
  Zvertexridgemax = 237;
  Zvertices = 238;
  Zvisfacettot = 239;
  Zvisfacetmax = 240;
  Zvisit = 241;
  Zvisit2max = 242;
  Zvisvertextot = 243;
  Zvisvertexmax = 244;
  Zvvisit = 245;
  Zvvisit2max = 246;
  Zwidefacet = 247;
  Zwidevertices = 248;
  ZEND = 249;

type
  Tztypes = longint;

const
  zdoc = 0;
  zinc = 1;
  zadd = 2;
  zmax = 3;
  zmin = 4;
  ZTYPEreal = 5;
  wadd = 6;
  wmax = 7;
  wmin = 8;
  ZTYPEend = 9;

type
  TintrealT = record
    case longint of
      0: (i: longint);
      1: (r: TrealT);
  end;
  PintrealT = ^TintrealT;

  TqhstatT = record
    stats: array[0..(ZEND) - 1] of TintrealT;
    id: array[0..(ZEND + 10) - 1] of byte;
    doc: array[0..(ZEND) - 1] of pchar;
    count: array[0..(ZEND) - 1] of smallint;
    _type: array[0..(ZEND) - 1] of char;
    printed: array[0..(ZEND) - 1] of char;
    init: array[0..(ZTYPEend) - 1] of TintrealT;
    next: longint;
    precision: longint;
    vridges: longint;
    tempi: longint;
    tempr: TrealT;
  end;
  PqhstatT = ^TqhstatT;

type
  TqhmemT = record
      BUFsize : longint;
      BUFinit : longint;
      TABLEsize : longint;
      NUMsizes : longint;
      LASTsize : longint;
      ALIGNmask : longint;
      freelists : ^pointer;
      sizetable : Plongint;
      indextable : Plongint;
      curbuffer : pointer;
      freemem : pointer;
      freesize : longint;
      tempstack : PsetT;
      ferr : PFILE;
      IStracing : longint;
      cntquick : longint;
      cntshort : longint;
      cntlong : longint;
      freeshort : longint;
      freelong : longint;
      totbuffer : longint;
      totdropped : longint;
      totfree : longint;
      totlong : longint;
      maxlong : longint;
      totshort : longint;
      totunused : longint;
      cntlarger : longint;
      totlarger : longint;
    end;
  PqhmemT = ^TqhmemT;

// =============0


type
  PPfacetT = ^PfacetT;
  PfacetT = ^TfacetT;

  TfacetT = bitpacked record
    furthestdist: TcoordT;
    maxoutside: TcoordT;
    offset: TcoordT;
    normal: PcoordT;
    f: record
      case longint of
        0: (area: TrealT);
        1: (replace: PfacetT);
        2: (samecycle: PfacetT);
        3: (newcycle: PfacetT);
        4: (trivisible: PfacetT);
        5: (triowner: PfacetT);
      end;
    center: PcoordT;
    previous: PfacetT;
    next: PfacetT;
    vertices: PsetT;
    ridges: PsetT;
    neighbors: PsetT;
    outsideset: PsetT;
    coplanarset: PsetT;
    visitid: dword;
    id: dword;
    nummerge: 0..511;
    tricoplanar: 0..1;
    newfacet: 0..1;
    visible: 0..1;
    toporient: 0..1;
    simplicial: 0..1;
    seen: 0..1;
    seen2: 0..1;
    flipped: 0..1;
    upperdelaunay: 0..1;
    notfurthest: 0..1;
    good: 0..1;
    isarea: 0..1;
    dupridge: 0..1;
    mergeridge: 0..1;
    mergeridge2: 0..1;
    coplanarhorizon: 0..1;
    mergehorizon: 0..1;
    cycledone: 0..1;
    tested: 0..1;
    keepcentrum: 0..1;
    newmerge: 0..1;
    degenerate: 0..1;
    redundant: 0..1;
    pad:array[0..3] of byte; // ????
  end;

const
  qh_MAXnummerge = 511;

type
  TridgeT = bitpacked record
    vertices: PsetT;
    top: PfacetT;
    bottom: PfacetT;
    id: dword;
    seen: 0..1;
    tested: 0..1;
    nonconvex: 0..1;
    mergevertex: 0..1;
    mergevertex2: 0..1;
    simplicialtop: 0..1;
    simplicialbot: 0..1;
  end;
  PridgeT = ^TridgeT;

type
  PPvertexT = ^PvertexT;
  PvertexT = ^TvertexT;

  TvertexT = bitpacked record
    next: PvertexT;
    previous: PvertexT;
    point: PpointT;
    neighbors: PsetT;
    id: dword;
    visitid: dword;
    seen: 0..1;
    seen2: 0..1;
    deleted: 0..1;
    delridge: 0..1;
    newfacet: 0..1;
    partitioned: 0..1;
  end;

const
  QHULL_NON_REENTRANT = 0;
  QHULL_QH_POINTER = 1;
  QHULL_REENTRANT = 2;
  QHULL_LIB_TYPE = QHULL_REENTRANT;

type
  PqhT = ^TqhT;
  TqhT = record
      ALLpoints : TboolT;
      ALLOWshort : TboolT;
      ALLOWwarning : TboolT;
      ALLOWwide : TboolT;
      ANGLEmerge : TboolT;
      APPROXhull : TboolT;
      MINoutside : TrealT;
      ANNOTATEoutput : TboolT;
      ATinfinity : TboolT;
      AVOIDold : TboolT;
      BESToutside : TboolT;
      CDDinput : TboolT;
      CDDoutput : TboolT;
      CHECKduplicates : TboolT;
      CHECKfrequently : TboolT;
      premerge_cos : TrealT;
      postmerge_cos : TrealT;
      DELAUNAY : TboolT;
      DOintersections : TboolT;
      DROPdim : longint;
      FLUSHprint : TboolT;
      FORCEoutput : TboolT;
      GOODpoint : longint;
      GOODpointp : PpointT;
      GOODthreshold : TboolT;
      GOODvertex : longint;
      GOODvertexp : PpointT;
      HALFspace : TboolT;
      ISqhullQh : TboolT;
      IStracing : longint;
      KEEParea : longint;
      KEEPcoplanar : TboolT;
      KEEPinside : TboolT;
      KEEPmerge : longint;
      KEEPminArea : TrealT;
      MAXcoplanar : TrealT;
      MAXwide : longint;
      MERGEexact : TboolT;
      MERGEindependent : TboolT;
      MERGING : TboolT;
      premerge_centrum : TrealT;
      postmerge_centrum : TrealT;
      MERGEpinched : TboolT;
      MERGEvertices : TboolT;
      MINvisible : TrealT;
      NOnarrow : TboolT;
      NOnearinside : TboolT;
      NOpremerge : TboolT;
      ONLYgood : TboolT;
      ONLYmax : TboolT;
      PICKfurthest : TboolT;
      POSTmerge : TboolT;
      PREmerge : TboolT;
      PRINTcentrums : TboolT;
      PRINTcoplanar : TboolT;
      PRINTdim : longint;
      PRINTdots : TboolT;
      PRINTgood : TboolT;
      PRINTinner : TboolT;
      PRINTneighbors : TboolT;
      PRINTnoplanes : TboolT;
      PRINToptions1st : TboolT;
      PRINTouter : TboolT;
      PRINTprecision : TboolT;
      PRINTout : array[0..(qh_PRINTEND_)-1] of Tqh_PRINT;
      PRINTridges : TboolT;
      PRINTspheres : TboolT;
      PRINTstatistics : TboolT;
      PRINTsummary : TboolT;
      PRINTtransparent : TboolT;
      PROJECTdelaunay : TboolT;
      PROJECTinput : longint;
      RANDOMdist : TboolT;
      RANDOMfactor : TrealT;
      RANDOMa : TrealT;
      RANDOMb : TrealT;
      RANDOMoutside : TboolT;
      REPORTfreq : longint;
      REPORTfreq2 : longint;
      RERUN : longint;
      ROTATErandom : longint;
      SCALEinput : TboolT;
      SCALElast : TboolT;
      SETroundoff : TboolT;
      SKIPcheckmax : TboolT;
      SKIPconvex : TboolT;
      SPLITthresholds : TboolT;
      STOPadd : longint;
      STOPcone : longint;
      STOPpoint : longint;
      TESTpoints : longint;
      TESTvneighbors : TboolT;
      TRACElevel : longint;
      TRACElastrun : longint;
      TRACEpoint : longint;
      TRACEdist : TrealT;
      TRACEmerge : longint;
      TRIangulate : TboolT;
      TRInormals : TboolT;
      UPPERdelaunay : TboolT;
      USEstdout : TboolT;
      VERIFYoutput : TboolT;
      VIRTUALmemory : TboolT;
      VORONOI : TboolT;
      AREAfactor : TrealT;
      DOcheckmax : TboolT;
      feasible_string : Pchar;
      feasible_point : PcoordT;
      GETarea : TboolT;
      KEEPnearinside : TboolT;
      hull_dim : longint;
      input_dim : longint;
      num_points : longint;
      first_point : PpointT;
      POINTSmalloc : TboolT;
      input_points : PpointT;
      input_malloc : TboolT;
      qhull_command : array[0..255] of AnsiChar;
      qhull_commandsiz2 : longint;
      rbox_command : array[0..255] of AnsiChar;
      qhull_options : array[0..511] of AnsiChar;
      qhull_optionlen : longint;
      qhull_optionsiz : longint;
      qhull_optionsiz2 : longint;
      run_id : longint;
      VERTEXneighbors : TboolT;
      ZEROcentrum : TboolT;
      upper_threshold : PrealT;
      lower_threshold : PrealT;
      upper_bound : PrealT;
      lower_bound : PrealT;
      ANGLEround : TrealT;
      centrum_radius : TrealT;
      cos_max : TrealT;
      DISTround : TrealT;
      MAXabs_coord : TrealT;
      MAXlastcoord : TrealT;
      MAXoutside : TrealT;
      MAXsumcoord : TrealT;
      MAXwidth : TrealT;
      MINdenom_1 : TrealT;
      MINdenom : TrealT;
      MINdenom_1_2 : TrealT;
      MINdenom_2 : TrealT;
      MINlastcoord : TrealT;
      NEARzero : PrealT;
      NEARinside : TrealT;
      ONEmerge : TrealT;
      outside_err : TrealT;
      WIDEfacet : TrealT;
      NARROWhull : TboolT;
      qhull : array[0..(sizeof('qhull'#0))-1] of Char;
      {$IFDEF Windows}
      pad0:array[0..13] of byte;
      {$ENDIF}
      {$IFDEF Linux}
      pad0:array[0..5] of byte;
      {$ENDIF}
      errexit : Tjmp_buf;
      jmpXtra : array[0..39] of Char;
      {$IFDEF Windows}
      pad1:array[0..3] of byte;
      {$ENDIF}
      restartexit : Tjmp_buf;
      jmpXtra2 : array[0..39] of Char;
      {$IFDEF Windows}
      pad2:array[0..3] of byte;
      {$ENDIF}
      fin : PFILE;
      fout : PFILE;
      ferr : PFILE;
      interior_point : PpointT;
      normal_size : longint;
      center_size : longint;
      TEMPsize : longint;
      facet_list : PfacetT;
      facet_tail : PfacetT;
      facet_next : PfacetT;
      newfacet_list : PfacetT;
      visible_list : PfacetT;
      num_visible : longint;
      tracefacet_id : dword;
      tracefacet : PfacetT;
      traceridge_id : dword;
      traceridge : PridgeT;
      tracevertex_id : dword;
      tracevertex : PvertexT;
      vertex_list : PvertexT;
      vertex_tail : PvertexT;
      newvertex_list : PvertexT;
      num_facets : longint;
      num_vertices : longint;
      num_outside : longint;
      num_good : longint;
      facet_id : dword;
      ridge_id : dword;
      vertex_id : dword;
      first_newfacet : dword;
      hulltime : Tculong;
      ALLOWrestart : TboolT;
      build_cnt : longint;
      CENTERtype : Tqh_CENTER;
      furthest_id : longint;
      last_errcode : longint;
      GOODclosest : PfacetT;
      coplanar_apex : PpointT;
      hasAreaVolume : TboolT;
      hasTriangulation : TboolT;
      isRenameVertex : TboolT;
      JOGGLEmax : TrealT;
      maxoutdone : TboolT;
      max_outside : TrealT;
      max_vertex : TrealT;
      min_vertex : TrealT;
      NEWfacets : TboolT;
      NEWtentative : TboolT;
      findbestnew : TboolT;
      findbest_notsharp : TboolT;
      NOerrexit : TboolT;
      PRINTcradius : TrealT;
      PRINTradius : TrealT;
      POSTmerging : TboolT;
      printoutvar : longint;
      printoutnum : longint;
      repart_facetid : dword;
      retry_addpoint : longint;
      QHULLfinished : TboolT;
      totarea : TrealT;
      totvol : TrealT;
      visit_id : dword;
      vertex_visit : dword;
      WAScoplanar : TboolT;
      ZEROall_ok : TboolT;
      facet_mergeset : PsetT;
      degen_mergeset : PsetT;
      vertex_mergeset : PsetT;
      hash_table : PsetT;
      other_points : PsetT;
      del_vertices : PsetT;
      gm_matrix : PcoordT;
      gm_row : ^PcoordT;
      line : Pchar;
      maxline : longint;
      half_space : PcoordT;
      temp_malloc : PcoordT;
      ERREXITcalled : TboolT;
      firstcentrum : TboolT;
      old_randomdist : TboolT;
      coplanarfacetset : PsetT;
      last_low : TrealT;
      last_high : TrealT;
      last_newhigh : TrealT;
      lastcpu : TrealT;
      lastfacets : longint;
      lastmerges : longint;
      lastplanes : longint;
      lastdist : longint;
      lastreport : dword;
      mergereport : longint;
      old_tempstack : PsetT;
      ridgeoutnum : longint;
      last_random : longint;
      rbox_errexit : Tjmp_buf;
      jmpXtra3 : array[0..39] of char;
      rbox_isinteger : longint;
      rbox_out_offset : double;
      cpp_object : pointer;
      cpp_other : pointer;
      cpp_user : pointer;
      qhmem : TqhmemT;
      qhstat : TqhstatT;
      {$IFDEF Windows}
      pad3:array[0..7] of byte;
      {$ENDIF}
    end;

procedure qh_errexit(qh: PqhT; exitcode: longint; facet: PfacetT; ridge: PridgeT); cdecl; external libqhull_r;
procedure qh_errprint(qh: PqhT; _string: pchar; atfacet: PfacetT; otherfacet: PfacetT; atridge: PridgeT; atvertex: PvertexT); cdecl; external libqhull_r;
function qh_new_qhull(qh: PqhT; dim: longint; numpoints: longint; points: PcoordT; ismalloc: TboolT; qhull_cmd: pchar; outfile: PFILE; errfile: PFILE): longint; cdecl; external libqhull_r;
procedure qh_printfacetlist(qh: PqhT; facetlist: PfacetT; facets: PsetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printhelp_degenerate(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printhelp_internal(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printhelp_narrowhull(qh: PqhT; fp: PFILE; minangle: TrealT); cdecl; external libqhull_r;
procedure qh_printhelp_singular(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printhelp_topology(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printhelp_wide(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_user_memsizes(qh: PqhT); cdecl; external libqhull_r;

procedure qh_exit(exitcode: longint); cdecl; external libqhull_r;
procedure qh_fprintf_stderr(msgcode: longint; fmt: pchar; args: array of const); cdecl; external libqhull_r;
procedure qh_fprintf_stderr(msgcode: longint; fmt: pchar); cdecl; external libqhull_r;
procedure qh_free(mem: pointer); cdecl; external libqhull_r;
function qh_malloc(size: Tsize_t): pointer; cdecl; external libqhull_r;

procedure qh_fprintf(qh: PqhT; fp: PFILE; msgcode: longint; fmt: pchar; args: array of const); cdecl; external libqhull_r;
procedure qh_fprintf(qh: PqhT; fp: PFILE; msgcode: longint; fmt: pchar); cdecl; external libqhull_r;
procedure qh_fprintf_rbox(qh: PqhT; fp: PFILE; msgcode: longint; fmt: pchar; args: array of const); cdecl; external libqhull_r;
procedure qh_fprintf_rbox(qh: PqhT; fp: PFILE; msgcode: longint; fmt: pchar); cdecl; external libqhull_r;

procedure qh_setdelaunay(qh: PqhT; dim: longint; count: longint; points: PpointT); cdecl; external libqhull_r;

function qh_clock(qh: PqhT): Tculong; cdecl; external libqhull_r;
procedure qh_checkflags(qh: PqhT; command: pchar; hiddenflags: pchar); cdecl; external libqhull_r;
procedure qh_clear_outputflags(qh: PqhT); cdecl; external libqhull_r;
procedure qh_freeqhull(qh: PqhT; allmem: TboolT); cdecl; external libqhull_r;
procedure qh_init_A(qh: PqhT; infile: PFILE; outfile: PFILE; errfile: PFILE; argc: longint; argv: PPchar); cdecl; external libqhull_r;
procedure qh_init_B(qh: PqhT; points: PcoordT; numpoints: longint; dim: longint; ismalloc: TboolT); cdecl; external libqhull_r;
procedure qh_init_qhull_command(qh: PqhT; argc: longint; argv: PPchar); cdecl; external libqhull_r;
procedure qh_initflags(qh: PqhT; command: pchar); cdecl; external libqhull_r;
procedure qh_initqhull_buffers(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initqhull_globals(qh: PqhT; points: PcoordT; numpoints: longint; dim: longint; ismalloc: TboolT); cdecl; external libqhull_r;
procedure qh_initqhull_mem(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initqhull_outputflags(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initqhull_start(qh: PqhT; infile: PFILE; outfile: PFILE; errfile: PFILE); cdecl; external libqhull_r;
procedure qh_initqhull_start2(qh: PqhT; infile: PFILE; outfile: PFILE; errfile: PFILE); cdecl; external libqhull_r;
procedure qh_initthresholds(qh: PqhT; command: pchar); cdecl; external libqhull_r;
procedure qh_lib_check(qhullLibraryType: longint; qhTsize: longint; vertexTsize: longint; ridgeTsize: longint; facetTsize: longint; setTsize: longint; qhmemTsize: longint); cdecl; external libqhull_r;
procedure qh_option(qh: PqhT; option: pchar; i: Plongint; r: PrealT); cdecl; external libqhull_r;
procedure qh_zero(qh: PqhT; errfile: PFILE); cdecl; external libqhull_r;

function qh_rboxpoints(qh: PqhT; rbox_command: pchar): longint; cdecl; external libqhull_r;
procedure qh_errexit_rbox(qh: PqhT; exitcode: longint); cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
