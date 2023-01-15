// Checks valid GTA:SA and SA:MP models
// NOTE: not the same as a function IsValidObject(objectid) 
// This is not check if an object exists, check only a model is valid.

stock IsValidObjectModel(modelid)
{
	if(modelid >= 321 && modelid <= 328 || modelid >= 330 && modelid <= 331) return 1;
	else if(modelid >= 333 && modelid <= 339 || modelid >= 341 && modelid <= 373) return 1;
	else if(modelid >= 615 && modelid <= 661 || modelid == 664) return 1; 
	else if(modelid >= 669 && modelid <= 698 || modelid >= 700 && modelid <= 792)  return 1;
	else if(modelid >= 800 && modelid <= 906 || modelid >= 910 && modelid <= 964) return 1;
	else if(modelid >= 966 && modelid <= 998 || modelid >= 1000 && modelid <= 1193) return 1;
	else if(modelid >= 1207 && modelid <= 1325 || modelid >= 1327 && modelid <= 1572) return 1;
	else if(modelid >= 1574 && modelid <= 1698 || modelid >= 1700 && modelid <= 2882) return 1;
	else if(modelid >= 2885 && modelid <= 3135 || modelid >= 3167 && modelid <= 3175) return 1;
	else if(modelid == 3178 || modelid == 3187 || modelid == 3193 || modelid == 3214) return 1;
	else if(modelid == 3221 || modelid >= 3241 && modelid <= 3244) return 1;
	else if(modelid == 3246 || modelid >= 3249 && modelid <= 3250) return 1;
	else if(modelid >= 3252 && modelid <= 3253 || modelid >= 3255 && modelid <= 3265) return 1;
	else if(modelid >= 3267 && modelid <= 3347 || modelid >= 3350 && modelid <= 3415) return 1;
	else if(modelid >= 3417 && modelid <= 3428 || modelid >= 3430 && modelid <= 3609) return 1;
	else if(modelid >= 3612 && modelid <= 3783 || modelid >= 3785 && modelid <= 3869) return 1;
	else if(modelid >= 3872 && modelid <= 3882 || modelid >= 3884 && modelid <= 3888) return 1;
	else if(modelid >= 3890 && modelid <= 3973 || modelid >= 3975 && modelid <= 4541) return 1;
	else if(modelid >= 4550 && modelid <= 4762 || modelid >= 4806 && modelid <= 5084) return 1;
	else if(modelid >= 5086 && modelid <= 5089 || modelid >= 5105 && modelid <= 5375) return 1;
	else if(modelid >= 5390 && modelid <= 5682 || modelid >= 5703 && modelid <= 6010) return 1;
	else if(modelid >= 6035 && modelid <= 6253 || modelid >= 6255 && modelid <= 6257) return 1;
	else if(modelid >= 6280 && modelid <= 6347 || modelid >= 6349 && modelid <= 6525) return 1;
	else if(modelid >= 6863 && modelid <= 7392 || modelid >= 7415 && modelid <= 7973) return 1;
	else if(modelid >= 7978 && modelid <= 9193 || modelid >= 9205 && modelid <= 9267) return 1;
	else if(modelid >= 9269 && modelid <= 9478 || modelid >= 9482 && modelid <= 10310) return 1;
	else if(modelid >= 10315 && modelid <= 10744 || modelid >= 10750 && modelid <= 11417) return 1;
	else if(modelid >= 11420 && modelid <= 11753 || modelid >= 12800 && modelid <= 13563) return 1;
	else if(modelid >= 13590 && modelid <= 13667 || modelid >= 13672 && modelid <= 13890) return 1;
	else if(modelid >= 14383 && modelid <= 14528 || modelid >= 14530 && modelid <= 14554) return 1;
	else if(modelid == 14556 || modelid >= 14558 && modelid <= 14643) return 1;
	else if(modelid >= 14650 && modelid <= 14657 || modelid >= 14660 && modelid <= 14695) return 1;
	else if(modelid >= 14699 && modelid <= 14728 || modelid >= 14735 && modelid <= 14765) return 1;
	else if(modelid >= 14770 && modelid <= 14856 || modelid >= 14858 && modelid <= 14883) return 1;
	else if(modelid >= 14885 && modelid <= 14898 || modelid >= 14900 && modelid <= 14903) return 1;
	else if(modelid >= 15025 && modelid <= 15064 || modelid >= 16000 && modelid <= 16790) return 1;
	else if(modelid >= 17000 && modelid <= 17474 || modelid >= 17500 && modelid <= 17974) return 1;
	else if(modelid == 17976 || modelid == 17978 || modelid >= 18000 && modelid <= 18036) return 1;
	else if(modelid >= 18038 && modelid <= 18102 || modelid >= 18104 && modelid <= 18105) return 1;
	else if(modelid == 18109 || modelid == 18112 || modelid >= 18200 && modelid <= 18859) return 1;
	else if(modelid >= 18860 && modelid <= 19274 || modelid >= 19275 && modelid <= 19595) return 1;
	else if(modelid >= 19596 && modelid <= 19999) return 1; 
	else return 0;
}