class Quiz {
  final int? id;
  final String? name;
  final String? title;
  final String? description;
  final String? difficultyLevel;
  final String? topic;
  final String? time;
  final bool? isPublished;
  final String? createdAt;
  final String? updatedAt;
  final String? duration;
  final String? endTime;
  final String? negativeMarks;
  final String? correctAnswerMarks;
  final bool? shuffle;
  final bool? showAnswers;
  final bool? lockSolutions;
  final bool? isForm;
  final bool? showMasteryOption;
  final String? readingMaterial;
  final String? quizType;
  final bool? isCustom;
  final String? bannerId;
  final String? examId;
  final bool? showUnanswered;
  final String? endsAt;
  final int? lives;
  final int? liveCount;
  final int? coinCount;
  final int? questionsCount;
  final String? dailyDate;
  final int? maxMistakeCount;
  final List<ReadingMaterial>? readingMaterials;
  final List<Questions>? questions;
  final String? progress;

  Quiz({
    this.id,
    this.name,
    this.title,
    this.description,
    this.difficultyLevel,
    this.topic,
    this.time,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.duration,
    this.endTime,
    this.negativeMarks,
    this.correctAnswerMarks,
    this.shuffle,
    this.showAnswers,
    this.lockSolutions,
    this.isForm,
    this.showMasteryOption,
    this.readingMaterial,
    this.quizType,
    this.isCustom,
    this.bannerId,
    this.examId,
    this.showUnanswered,
    this.endsAt,
    this.lives,
    this.liveCount,
    this.coinCount,
    this.questionsCount,
    this.dailyDate,
    this.maxMistakeCount,
    this.readingMaterials,
    this.questions,
    this.progress,
  });
  @override
  String toString() {
    return 'Quiz{id: $id, name: $name, title: $title, difficultyLevel: $difficultyLevel, topic: $topic}';
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    try {
      print('Deserializing Quiz: ${json['id']}'); // Debug field mapping
      return Quiz(
        id: json['id'] as int?,
        name: json['name'] as String?,
        title: json['title'] != null ? json['title'] as String? : "Default Title",
        description: json['description'] != null ? json['description'] as String? : "Default Description",
        difficultyLevel: json['difficulty_level'] as String?,
        topic: json['topic'] as String?,
        time: json['time'] as String?,
        isPublished: json['is_published'] as bool?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        duration: json['duration'] as String?,
        endTime: json['end_time'] as String?,
        negativeMarks: json['negative_marks'] as String?,
        correctAnswerMarks: json['correct_answer_marks'] as String?,
        shuffle: json['shuffle'] as bool?,
        showAnswers: json['show_answers'] as bool?,
        lockSolutions: json['lock_solutions'] as bool?,
        isForm: json['is_form'] as bool?,
        showMasteryOption: json['show_mastery_option'] as bool?,
        readingMaterial: json['reading_material'] as String?,
        quizType: json['quiz_type'] as String?,
        isCustom: json['is_custom'] as bool?,
        bannerId: json['banner_id'] as String?,
        examId: json['exam_id'] as String?,
        showUnanswered: json['show_unanswered'] as bool?,
        endsAt: json['ends_at'] as String?,
        lives: json['lives'] as int?,
        liveCount: json['live_count'] as int?,
        coinCount: json['coin_count'] as int?,
        questionsCount: json['questions_count'] as int?,
        dailyDate: json['daily_date'] as String?,
        maxMistakeCount: json['max_mistake_count'] as int?,
        readingMaterials: (json['reading_materials'] as List?)
            ?.map((v) => ReadingMaterial.fromJson(v as Map<String, dynamic>))
            .toList(),
        questions: (json['questions'] as List?)
            ?.map((v) => v != null ? Questions.fromJson(v as Map<String, dynamic>) : null)
            .whereType<Questions>() // Removes null values from the list
            .toList() ?? [],


        progress: json['progress'] as String?,
      );
    } catch (e) {
      print('Error during Quiz deserialization: $e');
      return Quiz();  // Return an empty Quiz object on error
    }
  }
}

class Questions {
  int? id;
  String? description;
  String? difficultyLevel;
  String? topic;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;
  String? detailedSolution;
  String? type;
  bool? isMandatory;
  bool? showInFeed;
  String? pyqLabel;
  int? topicId;
  int? readingMaterialId;
  String? fixedAt;
  String? fixSummary;
  String? createdBy;
  String? updatedBy;
  String? quizLevel;
  String? questionFrom;
  String? language;
  String? photoUrl;
  String? photoSolutionUrl;
  bool? isSaved;
  String? tag;
  List<Options>? options;
  ReadingMaterial? readingMaterial;

  @override
  String toString() {
    return 'Questions{id: $id, description: $description, difficultyLevel: $difficultyLevel, topic: $topic}';
  }

  Questions({
    this.id,
    this.description,
    this.difficultyLevel,
    this.topic,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.detailedSolution,
    this.type,
    this.isMandatory,
    this.showInFeed,
    this.pyqLabel,
    this.topicId,
    this.readingMaterialId,
    this.fixedAt,
    this.fixSummary,
    this.createdBy,
    this.updatedBy,
    this.quizLevel,
    this.questionFrom,
    this.language,
    this.photoUrl,
    this.photoSolutionUrl,
    this.isSaved,
    this.tag,
    this.options,
    this.readingMaterial,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      id: json['id'] as int?,
      description: json['description'] as String?,
      difficultyLevel: json['difficulty_level'] as String?,
      topic: json['topic'] as String?,
      isPublished: json['is_published'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      detailedSolution: json['detailed_solution'] as String?,
      type: json['type'] as String?,
      isMandatory: json['is_mandatory'] as bool?,
      showInFeed: json['show_in_feed'] as bool?,
      pyqLabel: json['pyq_label'] as String?,
      topicId: json['topic_id'] as int?,
      readingMaterialId: json['reading_material_id'] as int?,
      fixedAt: json['fixed_at'] as String?,
      fixSummary: json['fix_summary'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
      quizLevel: json['quiz_level'] as String?,
      questionFrom: json['question_from'] as String?,
      language: json['language'] as String?,
      photoUrl: json['photo_url'] as String?,
      photoSolutionUrl: json['photo_solution_url'] as String?,
      isSaved: json['is_saved'] as bool?,
      tag: json['tag'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((option) => Options.fromJson(option as Map<String, dynamic>))
          .toList(),
      readingMaterial: json['reading_material'] != null &&
          json['reading_material'] is Map<String, dynamic>
          ? ReadingMaterial.fromJson(
          json['reading_material'] as Map<String, dynamic>)
          : null,
    );
  }

}

class Options {
  int? id;
  String? description;
  int? questionId;
  bool? isCorrect;
  String? createdAt;
  String? updatedAt;
  bool? unanswered;
  String? photoUrl;

  Options({
    this.id,
    this.description,
    this.questionId,
    this.isCorrect,
    this.createdAt,
    this.updatedAt,
    this.unanswered,
    this.photoUrl,
  });
  @override
  String toString() {
    return 'Options{id: $id, description: $description, isCorrect: $isCorrect}';
  }
  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      id: json['id'] as int?,
      description: json['description'] as String?,
      questionId: json['question_id'] as int?,
      isCorrect: json['is_correct'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      unanswered: json['unanswered'] as bool?,
      photoUrl: json['photo_url'] as String?,
    );
  }
}

class ReadingMaterial {
  int? id;
  String? keywords;
  String? content;
  String? createdAt;
  String? updatedAt;
  List<String>? contentSections;
  PracticeMaterial? practiceMaterial;

  ReadingMaterial({
    this.id,
    this.keywords,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.contentSections,
    this.practiceMaterial,
  });
  @override
  String toString() {
    return 'ReadingMaterial{id: $id, keywords: $keywords, content: $content}';
  }
  factory ReadingMaterial.fromJson(Map<String, dynamic> json) {
    return ReadingMaterial(
      id: json['id'] as int?,
      keywords: json['keywords'] as String?,
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      contentSections: (json['content_sections'] as List?)
          ?.map((v) => v as String)
          .toList(),
      practiceMaterial: json['practice_material'] != null
          ? PracticeMaterial.fromJson(json['practice_material'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PracticeMaterial {
  List<String>? content;
  List<String>? keywords;

  PracticeMaterial({
    this.content,
    this.keywords,
  });

  factory PracticeMaterial.fromJson(Map<String, dynamic> json) {
    return PracticeMaterial(
      content: (json['content'] as List?)?.map((v) => v as String).toList(),
      keywords: (json['keywords'] as List?)?.map((v) => v as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = this.content;
    data['keywords'] = this.keywords;
    return data;
  }
}
