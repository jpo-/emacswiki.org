;;; naf-mode-db-flags.el --- keyword lists and regexps for font-locking in `naf-mode'
;; -*- mode: EMACS-LISP; -*-
;;; ================================================================
;;; DESCRIPTION:
;;; naf-mode-db-flags provides keyword lists and regexps for font-locking in
;;; `naf-mode' of generic db 'constants' e.g. words which appear routinely in
;;; national DBs but are not headwords and which do not fall under another
;;; broader class.
;;;
;;; FUNCTIONS:►►►
;;;
;;; FUNCTIONS:◄◄◄
;;;
;;; CONSTANTS:
;;; `naf-mode-db-numbers-flag'    -> Flagging of national db number fields.
;;; `*naf-mode-x-of*'             -> Keywords for name flags and x-of type relationships.
;;; `naf-mode-timestamp-flag'     -> :DOCUMENT-ME
;;; `naf-mode-accessed-by-flag'   -> :DOCUMENT-ME
;;; `naf-mode-url-flag'           -> :DOCUMENT-ME
;;;
;;; VARIABLES:
;;;
;;; MACROS:
;;;
;;; ALIASED/ADVISED/SUBST'D:
;;;
;;; DEPRECATED:
;;;
;;; RENAMED: 
;;;
;;; MOVED:
;;;
;;; MOVED:
;;; `naf-mode-db-field-flags-ulan-paren' -> ./naf-mode-ulan-utils.el
;;; REQUIRES:
;;;
;;; TODO:
;;; Following need to be :RENAMED   -> cannonical name
;;; `naf-mode-db-field-flags'       -> :DOCUMENT-ME :RENAME-ME -> -flag
;;; `naf-mode-alternate-name-flags' -> :DOCUMENT-ME :RENAME-ME -> -flag
;;; `naf-mode-benezit-date'         -> :DOCUMENT-ME :RENAME-ME -> -benezit-date-flag
;;; `*naf-mode-x-of*'               -> :DOCUMENT-ME :RENAME-ME -> -x-of-flag
;;;
;;;
;;; NOTES:
;;; This file uses the provide/require idiom because of the defconstant forms.
;;;
;;; SNIPPETS:
;;; naf-mode-CONSTANT-NAME uses naf-mode-FACENAME.
;;;
;;; THIRD PARTY CODE:
;;;
;;; AUTHOR: MON KEY
;;; MAINTAINER: MON KEY
;;;
;; URL: `http://www.emacswiki.org/emacs/naf-mode-db-flags.el')
;;; FILE-PUBLISHED: <Timestamp: #{2009-11-21T20:42:32-05:00Z}#{09477} - by MON KEY>
;;;
;;; CREATED:
;;; <Timestamp: Saturday April 11, 2009 @ 01:28.57 PM - by MON KEY>
;;; HEADER-ADDED: <Timestamp: #{2009-08-09T12:13:36-04:00Z}#{09327} - by MON KEY>
;;; ================================================================
;;; This file is not part of GNU Emacs.
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation; either version 3, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; see the file COPYING.  If not, write to
;;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;;; Floor, Boston, MA 02110-1301, USA.
;;; ================================================================
;;; Permission is granted to copy, distribute and/or modify this
;;; document under the terms of the GNU Free Documentation License,
;;; Version 1.3 or any later version published by the Free Software
;;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;;; and no Back-Cover Texts. A copy of the license is included in
;;; the section entitled "GNU Free Documentation License".
;;; A copy of the license is also available from the Free Software
;;; Foundation Web site at:
;;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ================================================================
;;; Copyright © 2009, 2010 MON KEY 
;;; ==============================
;;; CODE:

;;; ==============================
(provide 'naf-mode-db-flags)
;;; ==============================

;;; ==============================
;;; :MODIFICATIONS <Timestamp: Wednesday July 29, 2009 @ 03:44.51 PM  - by MON KEY>
(defconst naf-mode-timestamp-flag 
  (concat "\\(<Timestamp:\\)\\(.*\\)\\( - by "
          (regexp-opt
           (let ((mon-l (number-sequence 1 9))
                 (bug-l (number-sequence 1 7))
                 (rtn-l))
             (setq rtn-l '("Ebay"))
             (dolist (i mon-l)
               (setq rtn-l (cons (cadr (assoc i *MON-NAME*)) rtn-l)))
             (dolist (i bug-l)
               (setq rtn-l (cons (cadr (assoc i *BUG-NAME*)) rtn-l)))
             rtn-l)
           'paren)
          ">\\)")
  "*Regexp matches name portion \" - NAME\" of time stamp.\n
Used for fontlocking of timestamps generated with `mon-stamp'.
EXAMPLE:\n
<Timestamp: Wednesday July 29, 2009 @ 03:32.43 PM  - by MON KEY>\n
:SEE-ALSO `mon-timestamp', `mon-accessed-time-stamp', `mon-accessed-stamp',
`*mon-timestamp-cond*', `naf-mode-accessed-by-flag'.\n
:USED-IN `naf-mode'\n.►►►")
;; 
;;; :TEST-ME naf-mode-timestamp-flag
;;;(progn (makunbound 'naf-mode-timestamp-flag) (unintern 'naf-mode-timestamp-flag) )

;;; ==============================
;;; :MODIFICATIONS <Timestamp: Wednesday July 29, 2009 @ 03:44.51 PM  - by MON KEY>
(defconst naf-mode-accessed-by-flag
  (concat " - "
          (regexp-opt
           (let ((mon-l (number-sequence 1 9))
                 (bug-l (number-sequence 1 7))
                 (rtn-l))
             (dolist (i mon-l)
               (setq rtn-l (cons (cadr (assoc i *MON-NAME*)) rtn-l)))
             (dolist (i bug-l)
               (setq rtn-l (cons (cadr (assoc i *BUG-NAME*)) rtn-l)))
             rtn-l)
           'paren))
  "*Regexp to match name portion \" - NAME\" of accessed stamp in `naf-mode'.\n
Used for fontlocking of timestamps generated with `mon-accessed-stamp'.\n
:EXAMPLE\n
accessed: Wednesday July 29, 2009 - MON
.................................!______\n
:SEE-ALSO `mon-stamp', `mon-timestamp', `mon-accessed-time-stamp',
`*mon-timestamp-cond*', `naf-mode-timestamp-flag'.\n►►►")
;;
;;; :TEST-ME naf-mode-accessed-by-flag
;;;(progn (makunbound 'naf-mode-accessed-by-flag) 
;;;       (unintern 'naf-mode-accessed-by-flag) )

;;; ==============================
(defconst naf-mode-url-flag 
  (concat
   "\\(\\(http://\\)\\|\\(www\\.\\)\\)"
   "\\(\\("
   "\\(lccn.loc.gov/.*\\)\\|\\(catalogue.bnf.fr/\\).*\\(/PUBLIC\\)\\)"
   "\\|.*\\(\\."
   "\\(asp\\|aspx\\|cfm\\|com\\|edu\\|html\\|htm\\|gov"
   "\\|jsp\\|org\\|net\\|php\\|xml\\|shtml\\|xhtml\\)"
   "\\)\\)")
  "*Regexp to match URL strings for `naf-mode' font-locking.\n
:NOTE Specific to a limited set of naf-mode related URLs.\n
:FACE-FONT-LOCKING-WITH `naf-mode-field-url-flag-face'.
:FACE-DOCUMENTED-IN `naf-mode-field-url-flag-face'.
:SEE-ALSO `*mon-wrap-url-schemes*'.\n►►►")
;;
;;; :TEST-ME (search-forward-regexp naf-mode-url-flag)
;;; http://www.bubba.com/bubba.html
;;; http://www.bubba.com/bubba.htm
;;; http://lccn.loc.gov/06005491
;;; http://catalogue.bnf.fr/ark:/12148/ca126560159/PUBLIC
;;; http://catalogue.bnf.fr/
;;; 
;;;(progn (makunbound 'naf-mode-url-flag) (unintern 'naf-mode-url-flag) )

;;; ==============================
;;; :TODO Build regexp for this: "#{2009-08-15T21:01:56-04:00Z}#{09337}"
;;; In naf mode is not getting flagged correctly as spat out by  `mon-accessed-stamp'.
;;;
;;; (defconst naf-mode-time-stamp-ISO-flag

;;; ==============================
(defconst naf-mode-url-wrapper-flag "^\\(\\((URL `\\)\\(.*\\)\\(')\\)\\)[[:space:]]?$"
  "*Keyword for fontlocking the begining of URL refs in `naf-mode'.
Capture groups \\2{...}\\4 catch one URL on line BOL->EOL with/out traiiling WSP
e.g. \"^(URL {...}')\" _or_ \"^(URL {...}')    \".
:FACE-FONT-LOCKING-WITH `naf-mode-delimit-url-flag-face'
:FACE-DOCUMENTED-IN `naf-mode-delimit-url-flag-fface'.\n
:SEE-ALSO `naf-mode-url-flag',`*mon-wrap-url-schemes*'.\n►►►")
;;
;;; :TEST-ME (search-forward-regexp naf-mode-url-wrapper-flag)
;;
;;;(progn (makunbound 'naf-mode-url-wrapper-flag)
;;;       (unintern 'naf-mode-url-wrapper-flag) )

;;; ==============================
;;; :TODO LOC also has this now: nb2007017414
;;; :MODIFICATIONS: <Timestamp: Wednesday July 29, 2009 @ 03:54.19 PM  - by MON KEY>
(defconst naf-mode-db-numbers-flag
  (concat
   "\\(\\(\\(FRBNF\\)"                        ; <- grp1, grp2, grp3
   ;;^1^^2^^3^^^^^^^^
   "\\|\\(\\(n\\|n\\.\\|no\\|no\\.\\)[ ?]\\)" ; <- grp4 & grp5
   ;;^^^^4^^5^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   "\\|\\(\\[\\)\\)"                    ; <- grp6
   ;;^^^^6^^^^^^^^
   "\\([0-9]\\{8,10\\}\\(]?\\)"         ; <- grp7 & grp8
   ;;^7^^^^^^^^^^^^^^^^^8^^^^^
   "\\)"                                ; <- grp2 :CLOSE
   "\\)"                                ; <- grp1 :CLOSE
   "\\|\\<[0-9]\\{8,10\\}\\>")
;;; (concat "\\(\\(\\(FRBNF\\)\\|\\(\\(n\\|n\\.\\|no\\|no\\.\\)[ ?]\\)"
;;;         "\\|\\(\\[\\)\\)\\([0-9]\\{8,10\\}\\(]?\\)\\)\\)"
;;;         "\\|\\<[0-9]\\{8,10\\}\\>")
  "*Regexps for fontlocking national database UID's.\n
:EXAMPLEn 80126308\nno. 80126308\nn. 80126308\nno 94031775\nn 2005065776\nunk84240548
\[500006383]\nFRBNF12656015\nFRBNF32759170\n
:SEE-ALSO 
:USED-IN `naf-mode'.\n►►►")

;;; :TEST-ME naf-mode-db-numbers-flag
;;;(progn (makunbound 'naf-mode-db-numbers-flag)
;;;       (unintern 'naf-mode-db-numbers-flag) )

;;; ==============================
;;; '"\\(\\(FRBNF\\)\\|\\(\\(n\\|n\\\\.\\|no\\|no\\\\.\\)\\[ \\?]\\)\\|\\(\\\\[\\)\\)\\[0-9]\\{8,10\\}\\(]\\?\\)")
;;; '"\\(\\(FRBNF\\)\\|\\(\\(n\\|n\\.\\|no\\|no\\.\\)\\[ \\?]\\)\\|\\(\\[\\)\\)\\[0-9]\\{8,10\\}\\(]\\?\\)")
;;; :NOTE The following regexes works in query-replace -don't alter it! Make copies.
;;; \(\(FRBNF\)\|\(\(n\|n\.\|no\|no\.\)[ ?]\)\|\(\[\)\)[0-9]\{8,10\}\(]?\)
;;; \(\(\(FRBNF\)\|\(\(n\|n\.\|no\|no\.\)[ ?]\)\|\(\[\)\)\([0-9]\{8,10\}\(]?\)\)\)
;;; ==============================
;;; LOC
;;; n 80126308     8
;;; no. 80126308   8
;;; n. 80126308    8
;;; no 94031775    8
;;; n 2005065776   10
;;; unk84240548    8
;;; [500006383]    9
;;; FRBNF12656015  8
;;; FRBNF32759170  13
;;;
;;; NAFL8084600  ;;ULAN LOC NAF ref
;;; ==============================

;;; ==============================
;;; CREATED: <Timestamp: #{2009-09-10T14:36:43-04:00Z}#{09374} - by MON KEY>
(let ((naf-db-field-flags-bnf
       '("forme internationale"
         ;; ;Mise à jour :" ;;; not catching ':' is not a word const
         "Mise à jour : "  
         ;; "^\\(Sexe : \\(masculin\\|féminin\\)\\)"
         "masculin" "féminin"        
         )))
;;
(defconst naf-mode-db-field-flags-bnf
    (concat "\\<" (regexp-opt naf-db-field-flags-bnf 'paren))
    "*Regexp for font-locking terms which appear in conjunction with BNF
db-field names but occur secondary place in those fields.\n
EXAMPLE:\n\n\(search-forward-regexp naf-mode-db-field-flags-bnf nil t 3\)\)\n
forme internationale\nMise à jour :\nmasculin\nféminin\n
Fontlocking provided by `naf-mode-db-field-entry-bnf-fface'.\n
:SEE-ALSO `naf-db-field-flags'\n:USED-IN `naf-mode'.\n►►►"))

;;; ==============================
;;; `naf-mode-db-field-flags'
;;; This list can probably be anchored . highlighter later on...
;;; MODIFICATIONS: <Timestamp: Wednesday July 29, 2009 @ 04:04.11 PM  - by MON KEY>
(let ((naf-db-field-flags
       (list  "male"          ;;ULAN => ^\\(Gender: \\(male\\|female\\)\\)"
              "female")))
;;
(defconst naf-mode-db-field-flags
    (concat "\\<" (regexp-opt naf-db-field-flags 'paren) )
"*Regexp for matching for those terms which appear in conjunction with
db-field names but occur secondary place in those fields.\n
EXAMPLE:\nforme internationale\nMise à jour :\nmasculin\nféminin\nmale\nfemale\n
:SEE-ALSO\n:USED-IN `naf-mode'.\n►►►"))

;;; :TEST-ME naf-mode-db-field-flags
;;;(progn (makunbound 'naf-mode-db-field-flags) (unintern 'naf-mode-db-field-flags) )

;;; ==============================
;;; :MODIFICATIONS <Timestamp: Wednesday July 29, 2009 @ 04:01.11 PM  - by MON KEY>
;;; `naf-mode-alternate-name-flags'
(defvar naf-alternate-name-flags
  '("Also Known As"         "also known as"                   
    "Collective Name"        "collective name"                 
    "Collective Pen Name"    "collective pen name"             
    "Collective Pseudonym"   "collective pseudonym"            
    "Maiden Name"            "family name"                     
    "Nickname"               "maiden name"                     
    "Nom de guerre"          "married name"                    
    "Nom de plume"           "nickname"                        
    "Pen name"               "nom de guerre"                   
    "Pseudonyme"             "nom de plume"                    
    "Psuedonym"              "pen name"                        
    "Real Name"              "pseudonym"                       
    "Stage Name"             "pseudonyme forme internationale" 
    "Surname"                "pseudonyme"                      
    "True Name"              "real name"                       
    "stage name"
    "surname"                         
    "true name")
  "*Keyword list of terms used to designate an identities alternative identifiers.\n
:REGEXPS-IN `naf-mode-alternate-name-flags'
:SEE-ALSO `naf-mode-alternate-name-flags'.\n
:USED-IN `naf-mode'.\n►►►")
;;
(defconst naf-mode-alternate-name-flags 
  (concat "\\<" (regexp-opt naf-alternate-name-flags 'paren))
  "*Regexp for fontlocking keywords which occur in direct association with
an entities authoritative name form.\n
:KEYWORD-LISTS-IN `naf-alternate-name-flags'
:FACE-FONT-LOCKING-WITH `naf-mode-alternate-name-face'.
:FACE-DOCUMENTED-IN `naf-mode-alternate-name-fface'.
Terms typically indicate variant name forms or otherwise help to identify
alternative, pseudo. or pen names.
:SEE-ALSO 
:USED-IN `naf-mode'.\n►►►")
;;
;;;(progn (makunbound 'naf-mode-alternate-name-flags) 
;;;       (unintern 'naf-mode-alternate-name-flags) )

;;; ==============================
;;; :TODO
;;; '"\\(\\(\\(Né\\)\\|\\(Mort\\)\\) le \\)"
;;; '"\\<Né le\\>\\|\\<Mort le\\>"
;;; CREATED: <Timestamp: Monday June 23, 2008 @ 12:35.49 PM - by MON KEY>
(defconst naf-mode-benezit-date  "\\<Né\\>\\|\\<Née\\>\\|\\<Mort\\>"
  "*Regexp to matchthe beginning of the Benezit lifespan string in `naf-mode'.\n
:FACE-FONT-LOCKING-WITH `naf-mode-date-face'.
:FACE-DOCUMENTED-IN `naf-mode-date-fface'.
:SEE-ALSO \n:USED-IN `naf-mode'.")
;;
;;;(progn (makunbound 'naf-mode-benezit-date) 
;;;       (unintern 'naf-mode-benezit-date) )

;;; ==============================
;;; `naf-mode-active-date'
(defvar naf-active-date-flags
       '("Actif en"
         "Actif à"
         "actif en"
         "actif à"
         "active circa"
         "active Circa"
         "active c."
         "active ca."
         "active ca"
         "active cca."
         "Active c."
         "Active ca."
         "Active ca"
         "Active cca.")
"*List of strings commonly used to designate when an entity was active.\n
:REGEXPS-IN `naf-mode-active-date'.
:FACE-FONT-LOCKING-WITH `naf-mode-date-face'. 
:FACE-DOCUMENTED-IN `naf-mode-date-fface'.
:SEE-ALSO .\n
:USED-IN `naf-mode'.\n►►►")
;;
(defconst naf-mode-active-date
  (concat "\\<" (regexp-opt naf-active-date-flags 'paren) )
  "*Regexp to match the active period string in `naf-mode'.\n
:KEYWORD-LISTS-IN `naf-active-date-flags'.
:FACE-FONT-LOCKING-WITH `naf-mode-date-face'. 
:FACE-DOCUMENTED-IN `naf-mode-date-fface'.\n
:SEE-ALSO `naf-mode-active-date-flags-paren',
`naf-mode-active-date-flags-solo'.\n►►►")
;;
;;;(progn (makunbound 'naf-mode-active-date) (unintern 'naf-mode-active-date) )

;;; ==============================
;;; `naf-mode-active-date-flags-paren'
(defvar naf-active-date-flags-paren
  '("(active circa"
    "(active Circa"
    "(active c."
    "(active ca."
    "(active ca"
    "(active cca."
    "(Active c."
    "(Active ca."
    "(Active ca"
    "(Active cca."
    "(c"
    "(c."
    "(ca."
    "(ca"
    "(cca."
    "(ca."
    "(ca"
    "(cca.")
"*List of strings the active period string in `naf-mode'.\n
:REGEXPS-IN `naf-mode-active-date-flags-paren'
:FACE-FONT-LOCKING-WITH `naf-mode-date-face'. 
:FACE-DOCUMENTED-IN `naf-mode-date-fface'.\n
:SEE-ALSO \n
:USED-IN `naf-mode'.\n►►►")
;;
(defconst naf-mode-active-date-flags-paren (regexp-opt naf-active-date-flags-paren 'paren)
  "*Regexp to match the active date and periods in `naf-mode'.
:KEYWORD-LISTS-IN `naf-active-date-flags-paren'
:FACE-FONT-LOCKING-WITH `naf-mode-date-face'. 
:FACE-DOCUMENTED-IN `naf-mode-date-fface'.\n
EXAMPLE:
\(active circa\n\(active Circa\n\(active c.\n\(active ca.\n\(active ca
\(active cca.\n\(Active c.\n\(Active ca.\n\(Active ca\n\(Active cca.
\(c\n\(c.\n\(ca.\n\(ca\n\(cca.\n\(ca.\n\(ca\n\(cca.\n
:SEE-ALSO `naf-mode-active-date', `naf-mode-active-date-flags-solo'.\n►►►")
;;
;;;(progn (makunbound 'naf-mode-active-date-flags-paren)
;;;        (unintern 'naf-mode-active-date-flags-paren) )

;;; ==============================
;;; :MODIFICATIONS <Timestamp: Wednesday July 29, 2009 @ 04:12.28 PM  - by MON KEY>
;;; `naf-mode-active-date-flags-solo'
(defvar naf-active-date-flags-solo '(" c. " " ca. " " cca. " " ca. " " cca. ")
  "*List for matching the circa period string in `naf-mode'.
:REGEXPS-IN naf-mode-active-date-flags-solo
:FACE-FONT-LOCKING-WITH `naf-mode-date-face'
:FACE-DOCUMENTED-IN `naf-mode-date-fface'.\n
:SEE-ALSO .\n►►►")
;;
(defconst naf-mode-active-date-flags-solo (regexp-opt naf-active-date-flags-solo 'paren)
  "*Regexp to match the active period string in `naf-mode'.\n
:KEYWORD-LISTS-IN `naf-active-date-flags-solo'
:FACE-FONT-LOCKING-WITH `naf-mode-date-face'.
:FACE-DOCUMENTED-IN `naf-mode-date-fface'.\n
EXAMPLE:\n\" c. \"\n\" ca. \"\n\" cca. \"\n\" ca. \"\n\" cca. \"\n
:SEE-ALSO `naf-mode-active-date-flags-paren' , `naf-mode-active-date'.\n►►►")
;;
;;;(progn (makunbound 'naf-mode-active-date-flags-solo)
;;;       (unintern 'naf-mode-active-date-flags-solo) )

;;; ==============================
(defvar *regexp-french-date-prefix*
  '(("Mort en")
    ("Mort vers")
    ("Mort le")
    ("Mort à")
    ("Né en")
    ("Né le")
    ("Né à")
    ("Née en")
    ("Née à")
    ("Née le"))                         ; Century
  "*List of Benezit styled French birth/deatch strings.\n
:SEE-ALSO `*regexp-french-date-prefix*'.\n
:USED-IN `naf-mode'.\n►►►")


;;; ==============================
;;; :TODO (mon-insert-unicode "COMBINING LATIN SMALL LETTER E" t) ;-> ͤ
(defvar *regexp-french-date-siecle*
  '("xix siècle"
    "XIX siècle"
    "xix siècle"
    "xvii-xix siècles"
    "xvii siècle"
    "xviiͤ siècle"
    "XVIIͤ siècle"
    "xixͤ siècle"
    "XIXͤ siècle"
    "xixͤ siècle"
    "xviiͤ-xixͤ siècles")
"*List of Benezit styled French century and century range strings.\n
:SEE-ALSO `*regexp-french-date-prefix*'.\n
:USED-IN `naf-mode'.\n►►►")


;;; ==============================
;;; MODIFICATIONS: <Timestamp: Wednesday July 29, 2009 @ 04:11.23 PM  - by MON KEY>
(defvar *naf-x-of*
  '("Apprentice of"       "apprentice of"
    "Apprentice was"      "apprentice was"
    "Assisted by"         "assisted by"
    "Associate of"        "associate of"
    "Child of"            "child of"
    "Drawings of"         "drawings of"
    "Élève de"            "élève de"
    "Painting of"         "painting of"
    "Paintings of"        "paintings of"
    "Parent of"           "parent of"
    "Partner of"          "partner of"
    "Portrait de"         "portrait de"
    "Portrait of"         "portrait of"
    "Portraits de"        "portraits de"
    "Portraits of"        "portraits of"
    "Sibling of"          "sibling of"
    "Sketches of"         "sketches of"
    "Student of"          "student of"
    "Teacher of"          "teacher of"
    "Teacher was"         "teacher was"
    "Students of"         "students of" 
    "Student was"         "student was"
    "Studied with"        "studied with"
    "Studied under"       "studied under"
    "Élève de Gérôme"     "élève de Gérôme" ;; "Élève de Julian" | l'Académie Julian" | "Académie Julian"
    "Élève de Colorossi"  "élève de Colorossi" ;; Students of Jean Léon Gérôme | "Académie Gérôme"
    "Élève de Julian"     "élève de Julian" ;; Students of Gustave Boulanger | Académie Boulanger 
    "Élève de Bonnat"     "Élève de Bonnat" ;; Léon Bonnat
    )
  "*Keyword list x-of type relationships, for fontlocking in `naf-mode'.
:REGEXPS-IN `*naf-mode-x-of*'
:FACE-FONT-LOCKING-WITH `naf-mode-alternate-name-face'
:FACE-DOCUMENTED-IN `naf-mode-alternate-name-fface'
:SEE-ALSO `*naf-mode-x-of-ulan-bol*', `*naf-mode-ulan-rltd-ppl-corp*'.\n►►►")
;;
(defconst *naf-mode-x-of*
  (concat "\\<" (regexp-opt *naf-x-of* 'paren))
  "*Regexp matching x-of type relationships, for fontlocking in `naf-mode'.
:KEYWORD-LISTS-IN `*naf-x-of*'
:FACE-FONT-LOCKING-WITH `naf-mode-alternate-name-face'
:FACE-DOCUMENTED-IN `naf-mode-alternate-name-fface'
Unlike those identified by the regexps of `*naf-mode-ulan-rltd-ppl-corp*' and
`*naf-mode-x-of-ulan-bol*'.  This regexp triggers only when the relationship is
delimited by whitespace at BOW.  Whereas the keywords of
`*naf-mode-x-of-ulan-bol*' are intended for ULAN keywords at BOL in a headword
postion. Likewise, those of *naf-mode-ulan-rltd-ppl-corp* are identified as
having the capitalized form ':X-OF'\n
:NOTE These are primarily from ULAN.\n
:SEE-ALSO .\n►►►")

;;; :TEST-ME *naf-mode-x-of*
;;
;;;(progn (makunbound '*naf-mode-x-of*) (unintern '*naf-mode-x-of*) )

;;; ==============================
(require 'naf-mode-db-flags)
;;; ==============================

;;; ==============================
;;; This file uses the provide/require idiom because of the defconstant forms.
;;;(provide 'naf-mode-db-flags)
;;; ==============================

;;; ==============================
;;; naf-mode-db-flags.el ends here
;;; EOF
