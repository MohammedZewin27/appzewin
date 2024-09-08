









abstract class AnalysisRepo {
   Future  analysisEntryInteractionsSeller({required int idSeller,int? idUser});
   Future  analysisCallSeller({required int idSeller,int? idUser});
   Future  analysisSharingSeller({required int idSeller,int? idUser});
   Future  analysisLocationSeller({required int idSeller,int? idUser});
   Future  analysisWhatsAppSeller({required int idSeller,int? idUser});

   Future  analysisCallProduct({required int idProduct,required int idSeller,int? idUser});
   Future  analysisSharingProduct({required int idProduct,required int idSeller,int? idUser});
   Future  analysisLocationProduct({required int idProduct,required int idSeller,int? idUser});
   Future  analysisWhatsAppProduct({required int idProduct,required int idSeller,int? idUser});


   Future  entryInteractionsProduct({ required int idSeller,
      required int idProduct,
       int? idUser,});


}