clear all;

%-----------------------Input file---------------------------------------
inputFile = 'sygnal.wav';
% -------------------- Medium parameters----------------------------
GilbertToBad = 0.00001;
gtpMultiplier = 3;

GilbertToGood = 0.0008;    
gtgMultiplier = 2;

BernulliParameter = 0.00001;
bpMultiplier = 3;

%------------------------Codint parameters-----------------------------
HammingParameter = 11;



rawSignal = gen_fromWav(inputFile);


%Debug file to speed up the process
%rawSignal = load('debug.txt', 'ascii');

hammingEncoded = encode_hammingCode(HammingParameter, rawSignal);
repetitionEncoded = encode_repetitionCode(rawSignal);

gilbertRepetitionError = [];
gilbertHammingError = [];
basicMistakeRepetition = [];
basicMistakeHamming = [];

%------------- Write headers to analize files-------------------
  fid = fopen( 'wynikiGilbertRepet(p).csv','at');
  fprintf(fid, 'Nadmiarowosc; BER;');
  fprintf(fid, 'Iloœæ b³êdów wytworzonych na medium;p;r');
  fprintf(fid, '\n');
  fclose(fid);
  
  fid = fopen( 'wynikiGilbertRepet(r).csv','at');
  fprintf(fid, 'Nadmiarowosc; BER;');
  fprintf(fid, 'Iloœæ b³êdów wytworzonych na medium;p;r');
  fprintf(fid, '\n');
  fclose(fid);
  
  fid = fopen( 'wynikiBasicRepet(p).csv','at');
  fprintf(fid, 'Nadmiarowosc; BER;');
  fprintf(fid, 'Iloœæ b³êdów wytworzonych na medium;p');
  fprintf(fid, '\n');
  fclose(fid);


for n = 1:10
    [gilbertRepetitionBroken, gilbertRepetitionErrors] = gen_gilbert_mistake(GilbertToBad, GilbertToGood, repetitionEncoded);
    %[gilbertHammingBroken, gilbertHammingErrors] =  gen_gilbert_mistake(GilbertToBad, GilbertToGood, hammingEncoded);
    [basicMistakeRepetitionBroken, basicMistakeRepetitionErrors] = gen_basic_mistakeBits(BernulliParameter, repetitionEncoded);
    %[basicMistakeHammingBroken, basicMistakeHammingErrors] =  gen_basic_mistakeBits(BernulliParameter, hammingEncoded);
    
    decodedRepGilbert = decode_repetitionCode(gilbertRepetitionBroken);
    decodedRepBasic = decode_repetitionCode(basicMistakeRepetitionBroken);
    %decodedHammingGilbert = decode_hammingCode(HammingParameter, basicMistakeHammingBroken);
    %decodedHammingBasic = decode_hammingCode(HammingParameter, gilbertHammingBroken);
    
    
    
    
    basic_analyze(rawSignal, decodedRepGilbert, gilbertRepetitionBroken, 'wynikiGilbertRepet(p).csv',gilbertRepetitionErrors,GilbertToBad,GilbertToGood  );
    
    %gilbertHamHeaders = 'Iloœæ b³êdów wytworzonych na medium;p;r';
    %gilbertHamData = sfprintf('%16.d;%16.d;%16.d;', gilbertHammingErrors, GilbertToBad, GilbertToGood);
    %basic_analyze(rawSignal, decodedHammingGilbert, gilbertHammingBroken, 'wynikiGilbertHam.csv', gilbertHamData, gilbertHamHeaders);
    
    %basicHamHeaders = 'Iloœæ b³êdów wytworzonych na medium;p';
    %basicHamData = sfprintf('%16.d;%16.d;', basicMistakeHammingErrors, BernulliParameter);
    %basic_analyze(rawSignal, decodedHammingBasic, basicMistakeHammingBroken, 'wynikiBasicHam.csv', basicHamData, basicHamHeaders);
    
    basic_analyze(rawSignal, decodedRepBasic, basicMistakeRepetitionBroken, 'wynikiBasicRepet(p).csv', basicMistakeRepetitionErrors,BernulliParameter,'' );
    
    
    BernulliParameter = BernulliParameter*bpMultiplier;
    GilbertToBad = GilbertToBad*gtpMultiplier;
    %GilbertToGood =GilbertToGood*gtgMultiplier;

    disp( sprintf( 'Iteration: %d',i) );
    i = i +1;
end


for n = 1:10
    [gilbertRepetitionBroken, gilbertRepetitionErrors] = gen_gilbert_mistake(GilbertToBad, GilbertToGood, repetitionEncoded);
    %[gilbertHammingBroken, gilbertHammingErrors] =  gen_gilbert_mistake(GilbertToBad, GilbertToGood, hammingEncoded);
    %[basicMistakeRepetitionBroken, basicMistakeRepetitionErrors] = gen_basic_mistakeBits(BernulliParameter, repetitionEncoded);
    %[basicMistakeHammingBroken, basicMistakeHammingErrors] =  gen_basic_mistakeBits(BernulliParameter, hammingEncoded);
    
    decodedRepGilbert = decode_repetitionCode(gilbertRepetitionBroken);
    %decodedRepBasic = decode_repetitionCode(basicMistakeRepetitionBroken);
    %decodedHammingGilbert = decode_hammingCode(HammingParameter, basicMistakeHammingBroken);
    %decodedHammingBasic = decode_hammingCode(HammingParameter, gilbertHammingBroken);
    
    
    
    
    basic_analyze(rawSignal, decodedRepGilbert, gilbertRepetitionBroken, 'wynikiGilbertRepet(r).csv',gilbertRepetitionErrors,GilbertToBad,GilbertToGood  );
    
    %gilbertHamHeaders = 'Iloœæ b³êdów wytworzonych na medium;p;r';
    %gilbertHamData = sfprintf('%16.d;%16.d;%16.d;', gilbertHammingErrors, GilbertToBad, GilbertToGood);
    %basic_analyze(rawSignal, decodedHammingGilbert, gilbertHammingBroken, 'wynikiGilbertHam.csv', gilbertHamData, gilbertHamHeaders);
    
    %basicHamHeaders = 'Iloœæ b³êdów wytworzonych na medium;p';
    %basicHamData = sfprintf('%16.d;%16.d;', basicMistakeHammingErrors, BernulliParameter);
    %basic_analyze(rawSignal, decodedHammingBasic, basicMistakeHammingBroken, 'wynikiBasicHam.csv', basicHamData, basicHamHeaders);
    
    %basic_analyze(rawSignal, decodedRepBasic, basicMistakeRepetitionBroken, 'wynikiBasicRepet(p).csv', basicMistakeRepetitionErrors,BernulliParameter,'' );
    
    
    %BernulliParameter = BernulliParameter*bpMultiplier;
    %GilbertToBad = GilbertToBad*gtpMultiplier;
    GilbertToGood =GilbertToGood*gtgMultiplier;

    disp( sprintf( 'Iteration: %d',i) );
    i = i +1;
end
