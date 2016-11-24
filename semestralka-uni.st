Object subclass: #TeacherRole	instanceVariableNames: 'teachingRelatorsCol'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!TeacherRole commentStamp: '<historical>' prior: 0!!!TeacherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!teachingRelatorsCol
	
	^teachingRelatorsCol ifNil: [teachingRelatorsCol := OrderedCollection new]! !!TeacherRole methodsFor: 'accessing' stamp: 'IvanRyant 10/25/2014 07:01'!salaryComponent	"component of the salary for particular role of the professor -- POLYMORPHIC"	^self class ratePerSubject * self teachesSet size! !!TeacherRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!teachesSet
	
	^(self teachingRelatorsCol collect: [:each | each subject]) asSet! !!TeacherRole methodsFor: 'testing' stamp: 'IvanRyant 9/13/2013 14:41'!checkTeachingMult
	
	^self teachingRelatorsCol size >= 1! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!TeacherRole class	instanceVariableNames: ''!!TeacherRole class commentStamp: '<historical>' prior: 0!!!TeacherRole class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."

	^super new initialize! !!TeacherRole class methodsFor: 'accessing' stamp: 'IvanRyant 10/25/2014 06:58'!ratePerSubject	"rate for every subject tought that contributes to the teaching salary component"	^1000! !Object subclass: #Department	instanceVariableNames: 'name code staffSet'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!Department commentStamp: '<historical>' prior: 0!!!Department methodsFor: 'printing' stamp: 'IvanRyant 11/3/2014 01:38'!printOn: aStream	"Append to the argument, aStream, a sequence of characters that  	identifies the receiver."	| tmp |	tmp := (self departmentName ifNil: [ '?NoName?' ] ifNotNil: [self departmentName]).	aStream		nextPutAll: 'Department: ';		nextPutAll: tmp! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!staffSet
	
	^staffSet ifNil: [staffSet := Set new]! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!code: anObject

	code := anObject! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!guaranteedSubjectsSet: allSubjectsSet
	"collect all the subjects that the members of this department guarantee"
	
	| roles |
	roles := self staffSet flatCollect: [:professor | professor subjectGuarantorRolesCol].
	^(allSubjectsSet select: [:each | roles includes: each guarantor]) asSet! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:31'!departmentName: anObject

	name := anObject! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!taughtSubjectsSet
	"collect all the subjects that the teachers of this department teach"
	
	^(self staffSet flatCollect: [:professor | professor teacherRolesCol flatCollect: [:teacherRole | teacherRole teachesSet]]) asSet! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:31'!departmentName

	^name! !!Department methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!code

	^code! !!Department methodsFor: 'testing' stamp: 'IvanRyant 9/13/2013 14:41'!checkStaffMult
	"Checking of staff multiplicity constraint 1..*"
	
	^self staffSet size >= 1! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Department class	instanceVariableNames: ''!!Department class commentStamp: '<historical>' prior: 0!!!Department class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."

	^super new initialize! !Object subclass: #SuspendedStudentPhase	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!SuspendedStudentPhase commentStamp: '<historical>' prior: 0!!"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!SuspendedStudentPhase class	instanceVariableNames: ''!!SuspendedStudentPhase class commentStamp: '<historical>' prior: 0!!!SuspendedStudentPhase class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^super new initialize! !Object subclass: #SubjectRegistration	instanceVariableNames: 'registered subject'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!SubjectRegistration commentStamp: '<historical>' prior: 0!!!SubjectRegistration methodsFor: 'initialize-release' stamp: 'IvanRyant 10/7/2013 15:55'!initialize
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	registered := TimeStamp now.
	^self! !!SubjectRegistration methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!registered: anObject
	
	registered := anObject! !!SubjectRegistration methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!registered
	
	^registered! !!SubjectRegistration methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!subject
	
	^subject! !!SubjectRegistration methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!subject: anObject
	
	subject := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!SubjectRegistration class	instanceVariableNames: ''!!SubjectRegistration class commentStamp: '<historical>' prior: 0!!!SubjectRegistration class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	
	^self shouldNotImplement! !!SubjectRegistration class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!subject: aSubject
	
	^(super new)
		subject: aSubject;
		initialize;
		yourself	"sets timestamp to the current date-time"! !Object subclass: #TeachingRelator	instanceVariableNames: 'room time subject'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!TeachingRelator commentStamp: '<historical>' prior: 0!!!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!room: anObject

	room := anObject! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!room

	^room! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!time

	^time! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!subject

	^subject! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!time: anObject

	time := anObject! !!TeachingRelator methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!subject: anObject

	subject := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!TeachingRelator class	instanceVariableNames: ''!!TeachingRelator class commentStamp: '<historical>' prior: 0!!!TeachingRelator class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^self shouldNotImplement! !!TeachingRelator class methodsFor: 'instance creation' stamp: 'IvanRyant 10/7/2013 15:41'!subject: aSubject
	
	^(super new)
		initialize;
		subject: aSubject;
		yourself! !Object subclass: #ActiveStudentPhase	instanceVariableNames: 'registeredSubjectsCol'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!ActiveStudentPhase commentStamp: '<historical>' prior: 0!!!ActiveStudentPhase methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!registeredSubjectsCol
	
	^registeredSubjectsCol ifNil: [registeredSubjectsCol := OrderedCollection new]! !!ActiveStudentPhase methodsFor: 'methods' stamp: 'IvanRyant 9/13/2013 14:41'!studiesSet
	"collects all subjects that are bound to the active student by the registeredSubjects association"
	
	^(self registeredSubjectsCol collect: [:each | each subject]) asSet! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ActiveStudentPhase class	instanceVariableNames: ''!!ActiveStudentPhase class commentStamp: '<historical>' prior: 0!!!ActiveStudentPhase class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^super new initialize! !Object subclass: #Person	instanceVariableNames: 'titlesBefore name titlesAfter dateOfBirth'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!Person commentStamp: '<historical>' prior: 0!!!Person methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:37'!personName: anObject

	name := anObject! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:37'!personName

	^name! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesAfter: anObject

	titlesAfter := anObject! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesBefore: anObject

	titlesBefore := anObject! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesBefore

	^titlesBefore! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 11/3/2014 01:57'!nameWithTitles
		| tBefore tAfter pName |	tBefore := (self titlesBefore ifNil: [ '' ] ifNotNil: [self titlesBefore, ' ']).
	tAfter := (self titlesAfter ifNil: [ '' ] ifNotNil: [' ', self titlesAfter]).
	pName := (self personName ifNil: [ '?NoName?' ] ifNotNil: [' ', self personName]).
	^tBefore, pName, tAfter! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesAfter

	^titlesAfter! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 10/16/2013 22:57'!dateOfBirth: anObject
	dateOfBirth := anObject! !!Person methodsFor: 'accessing' stamp: 'IvanRyant 10/16/2013 22:56'!dateOfBirth
	^dateOfBirth! !!Person methodsFor: 'printing' stamp: 'IvanRyant 11/3/2014 01:39'!printOn: aStream	"Append to the argument, aStream, a sequence of characters that  	identifies the receiver."	| tmp |	tmp := (self nameWithTitles ifNil: [ '?NoName?' ] ifNotNil: [self nameWithTitles]).	aStream		nextPutAll: 'Person: ';		nextPutAll: tmp! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Person class	instanceVariableNames: ''!!Person class commentStamp: '<historical>' prior: 0!!!Person class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."

	^super new initialize! !Object subclass: #StudentRole	instanceVariableNames: 'phase person researchRelatorsCol'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!StudentRole commentStamp: '<historical>' prior: 0!!!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:42'!studentName: anObject

	self person personName: anObject! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:27'!titlesBefore: anObject

	self person titlesBefore: anObject! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:27'!titlesBefore

	^self person titlesBefore! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:42'!studentName

	^self person personName! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!phase: anObject
	
	phase := anObject! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:21'!person

	^person! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:24'!nameWithTitles
	
	^self person nameWithTitles! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:26'!titlesAfter: anObject

	self person titlesAfter: anObject! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!phase
	
	^phase ifNil: [phase := SuspendedStudentPhase new]! !!StudentRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:25'!titlesAfter

	^self person titlesAfter! !!StudentRole methodsFor: 'initialize-release' stamp: 'IvanRyant 10/30/2014 02:26'!initializePerson: aPerson
	person := aPerson
! !!StudentRole methodsFor: 'printing' stamp: 'IvanRyant 11/3/2014 01:41'!printOn: aStream	"Append to the argument, aStream, a sequence of characters that  	identifies the receiver."	| tmp |	tmp := (self nameWithTitles ifNil: [ '?NoName?' ] ifNotNil: [self nameWithTitles]).	aStream		nextPutAll: 'Student: ';		nextPutAll: tmp! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!StudentRole class	instanceVariableNames: ''!!StudentRole class commentStamp: '<historical>' prior: 0!!!StudentRole class methodsFor: 'instance creation' stamp: 'IvanRyant 10/30/2014 02:25'!person: aPerson
	
	^(super new)
		"initialize: aPerson;"		initializePerson: aPerson;		yourself! !!StudentRole class methodsFor: 'instance creation' stamp: 'IvanRyant 10/7/2013 15:42'!new
	"Answer a newly created and initialized instance."
	
	^self shouldNotImplement! !Object subclass: #SubjectGuarantorRole	instanceVariableNames: 'startDate'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!SubjectGuarantorRole commentStamp: '<historical>' prior: 0!!!SubjectGuarantorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate: anObject
	
	startDate := anObject! !!SubjectGuarantorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate
	
	^startDate ifNil: [startDate := Date today]! !!SubjectGuarantorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/25/2014 06:50'!salaryComponent	"component of the salary for particular role of the professor -- POLYMORPHIC"	^self class fixRate! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!SubjectGuarantorRole class	instanceVariableNames: ''!!SubjectGuarantorRole class commentStamp: '<historical>' prior: 0!!!SubjectGuarantorRole class methodsFor: 'accessing' stamp: 'IvanRyant 10/25/2014 06:45'!fixRate	"component of salary for every guarantor role is fixed"	^1000	! !!SubjectGuarantorRole class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	"Answer a newly created and initialized instance."
	
	^super new initialize! !Object subclass: #ProfessorRole	instanceVariableNames: 'headOfDepartment startDate person subrolesCol'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!ProfessorRole commentStamp: '<historical>' prior: 0!!!ProfessorRole methodsFor: 'printing' stamp: 'IvanRyant 11/3/2014 01:40'!printOn: aStream	"Append to the argument, aStream, a sequence of characters that  	identifies the receiver."	| tmp |	tmp := (self nameWithTitles ifNil: [ '?NoName?' ] ifNotNil: [self nameWithTitles]).	aStream		nextPutAll: 'Professor: ';		nextPutAll: tmp! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/16/2013 23:45'!dateOfBirth
	^self person dateOfBirth! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate
	
	^startDate! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!headOfDepartment

	^headOfDepartment ifNil: [headOfDepartment := false]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesBefore: anObject

	self person titlesBefore: anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesBefore

	^self person titlesBefore! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/16/2013 23:47'!dateOfBirth: anObject
	self person dateOfBirth: anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:42'!professorName: anObject

	self person personName: anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:41'!professorName

	^self person personName! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:08'!subjectGuarantorRolesCol
	
	^self subrolesCol select: [:r | r isKindOf: SubjectGuarantorRole]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!startDate: anObject
	
	startDate := anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!headOfDepartment: anObject

	headOfDepartment := anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:07'!teacherRolesCol
	
	^self subrolesCol select: [:r | r isKindOf: TeacherRole]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:12'!nameWithTitles
	
	^self person nameWithTitles! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/7/2013 15:07'!subrolesCol
	
	^subrolesCol ifNil: [subrolesCol := OrderedCollection new]! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesAfter: anObject

	self person titlesAfter: anObject! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 10/25/2014 07:19'!salary
	
	| years components |
	years := Date today year - self startDate year.	components := self subrolesCol inject: 0 into: [:sum :each | sum + each salaryComponent]. 	"Salary sum as an example of polymorphic behaviour. BE CAREFUL ABOUT THE BRACKETS!!!!!!"
	^self class fixRate + (years * self class bonusPerYear) + components! !!ProfessorRole methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!titlesAfter

	^self person titlesAfter! !!ProfessorRole methodsFor: 'initialize-release' stamp: 'IvanRyant 10/30/2014 02:27'!initializePerson: aPerson
	
	person := aPerson
! !!ProfessorRole methodsFor: 'testing' stamp: 'IvanRyant 10/7/2013 15:10'!checkTeachingMult
	
	^self teacherRolesCol size >= 1! !!ProfessorRole methodsFor: 'private' stamp: 'IvanRyant 9/13/2013 14:41'!person
	^person! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ProfessorRole class	instanceVariableNames: ''!!ProfessorRole class commentStamp: '<historical>' prior: 0!!!ProfessorRole class methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!fixRate
	
	^14000! !!ProfessorRole class methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!bonusPerYear
	
	^2000! !!ProfessorRole class methodsFor: 'instance creation' stamp: 'IvanRyant 10/30/2014 02:25'!person: aPerson
	
	^(super new)
		initializePerson: aPerson;		startDate: Date today;		yourself! !!ProfessorRole class methodsFor: 'instance creation' stamp: 'IvanRyant 10/7/2013 15:42'!new
	"Answer a newly created and initialized instance."

	^self shouldNotImplement! !Object subclass: #Subject	instanceVariableNames: 'name code credits guarantor'	classVariableNames: ''	poolDictionaries: ''	category: 'semestralka-uni'!!Subject commentStamp: '<historical>' prior: 0!!!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!guarantor: anObject
	
	guarantor := anObject! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!code: anObject

	code := anObject! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:49'!subjectName

	^name! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!guarantor
	
	^guarantor! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 10/30/2014 02:49'!subjectName: anObject

	name := anObject! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!credits

	^credits! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!credits: anObject

	credits := anObject! !!Subject methodsFor: 'accessing' stamp: 'IvanRyant 9/13/2013 14:41'!code

	^code! !!Subject methodsFor: 'printing' stamp: 'IvanRyant 11/3/2014 01:42'!printOn: aStream	"Append to the argument, aStream, a sequence of characters that  	identifies the receiver."	| tmp |	tmp := (self subjectName ifNil: [ '?NoName?' ] ifNotNil: [self subjectName]).	aStream		nextPutAll: 'Subject: ';		nextPutAll: tmp! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Subject class	instanceVariableNames: ''!!Subject class commentStamp: '<historical>' prior: 0!!!Subject class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!guarantor: aSubjectGuarantorRole
	
	^(super new)
		guarantor: aSubjectGuarantorRole;
		initialize;
		yourself! !!Subject class methodsFor: 'instance creation' stamp: 'IvanRyant 9/13/2013 14:41'!new
	
	^self shouldNotImplement! !