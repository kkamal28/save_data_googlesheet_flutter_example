class FeedbackForm {
  String _news;
  String _headline;
  String _imageUrl;

  FeedbackForm(
    this._news,
    this._headline,
    this._imageUrl,
  );

  // Method to make GET parameters.
  String toParams() => "?news=$_news&headline=$_headline&images=$_imageUrl";
}
