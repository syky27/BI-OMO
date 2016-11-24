Object subclass: #TeacherRole
	
	^teachingRelatorsCol ifNil: [teachingRelatorsCol := OrderedCollection new]! !
	
	^(self teachingRelatorsCol collect: [:each | each subject]) asSet! !
	
	^self teachingRelatorsCol size >= 1! !
	"Answer a newly created and initialized instance."

	^super new initialize! !
	
	^staffSet ifNil: [staffSet := Set new]! !

	code := anObject! !
	"collect all the subjects that the members of this department guarantee"
	
	| roles |
	roles := self staffSet flatCollect: [:professor | professor subjectGuarantorRolesCol].
	^(allSubjectsSet select: [:each | roles includes: each guarantor]) asSet! !

	name := anObject! !
	"collect all the subjects that the teachers of this department teach"
	
	^(self staffSet flatCollect: [:professor | professor teacherRolesCol flatCollect: [:teacherRole | teacherRole teachesSet]]) asSet! !

	^name! !

	^code! !
	"Checking of staff multiplicity constraint 1..*"
	
	^self staffSet size >= 1! !
	"Answer a newly created and initialized instance."

	^super new initialize! !
	"Answer a newly created and initialized instance."
	
	^super new initialize! !
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	registered := TimeStamp now.
	^self! !
	
	registered := anObject! !
	
	^registered! !
	
	^subject! !
	
	subject := anObject! !
	
	^self shouldNotImplement! !
	
	^(super new)
		subject: aSubject;
		initialize;
		yourself	"sets timestamp to the current date-time"! !

	room := anObject! !

	^room! !

	^time! !

	^subject! !

	time := anObject! !

	subject := anObject! !
	"Answer a newly created and initialized instance."
	
	^self shouldNotImplement! !
	
	^(super new)
		initialize;
		subject: aSubject;
		yourself! !
	
	^registeredSubjectsCol ifNil: [registeredSubjectsCol := OrderedCollection new]! !
	"collects all subjects that are bound to the active student by the registeredSubjects association"
	
	^(self registeredSubjectsCol collect: [:each | each subject]) asSet! !
	"Answer a newly created and initialized instance."
	
	^super new initialize! !

	name := anObject! !

	^name! !

	titlesAfter := anObject! !

	titlesBefore := anObject! !

	^titlesBefore! !
	
	tAfter := (self titlesAfter ifNil: [ '' ] ifNotNil: [' ', self titlesAfter]).
	pName := (self personName ifNil: [ '?NoName?' ] ifNotNil: [' ', self personName]).
	^tBefore, pName, tAfter! !

	^titlesAfter! !
	dateOfBirth := anObject! !
	^dateOfBirth! !
	"Answer a newly created and initialized instance."

	^super new initialize! !

	self person personName: anObject! !

	self person titlesBefore: anObject! !

	^self person titlesBefore! !

	^self person personName! !
	
	phase := anObject! !

	^person! !
	
	^self person nameWithTitles! !

	self person titlesAfter: anObject! !
	
	^phase ifNil: [phase := SuspendedStudentPhase new]! !

	^self person titlesAfter! !
	person := aPerson
! !
	
	^(super new)
		"initialize: aPerson;"
	"Answer a newly created and initialized instance."
	
	^self shouldNotImplement! !
	
	startDate := anObject! !
	
	^startDate ifNil: [startDate := Date today]! !
	"Answer a newly created and initialized instance."
	
	^super new initialize! !
	^self person dateOfBirth! !
	
	^startDate! !

	^headOfDepartment ifNil: [headOfDepartment := false]! !

	self person titlesBefore: anObject! !

	^self person titlesBefore! !
	self person dateOfBirth: anObject! !

	self person personName: anObject! !

	^self person personName! !
	
	^self subrolesCol select: [:r | r isKindOf: SubjectGuarantorRole]! !
	
	startDate := anObject! !

	headOfDepartment := anObject! !
	
	^self subrolesCol select: [:r | r isKindOf: TeacherRole]! !
	
	^self person nameWithTitles! !
	
	^subrolesCol ifNil: [subrolesCol := OrderedCollection new]! !

	self person titlesAfter: anObject! !
	
	| years components |
	years := Date today year - self startDate year.
	^self class fixRate + (years * self class bonusPerYear) + components! !

	^self person titlesAfter! !
	
	person := aPerson
! !
	
	^self teacherRolesCol size >= 1! !
	^person! !
	
	^14000! !
	
	^2000! !
	
	^(super new)
		initializePerson: aPerson;
	"Answer a newly created and initialized instance."

	^self shouldNotImplement! !
	
	guarantor := anObject! !

	code := anObject! !

	^name! !
	
	^guarantor! !

	name := anObject! !

	^credits! !

	credits := anObject! !

	^code! !
	
	^(super new)
		guarantor: aSubjectGuarantorRole;
		initialize;
		yourself! !
	
	^self shouldNotImplement! !