COPY person            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/person_0_0.csv'                      (DELIMITER '|', HEADER);
COPY place            FROM '../../../third_party/planir/resource/graph/sf01_merge/static/place_0_0.csv'                      (DELIMITER '|', HEADER);
COPY tag            FROM '../../../third_party/planir/resource/graph/sf01_merge/static/tag_0_0.csv'                      (DELIMITER '|', HEADER);

COPY tagclass            FROM '../../../third_party/planir/resource/graph/sf01_merge/static/tagclass_0_0.csv'                      (DELIMITER '|', HEADER);

COPY forum             FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/forum_0_0.csv'                       (DELIMITER '|', HEADER);

COPY comment             FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/comment_0_0.csv'                       (DELIMITER '|', HEADER);

COPY post             FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/post_0_0.csv'                       (DELIMITER '|', HEADER);

COPY organisation             FROM '../../../third_party/planir/resource/graph/sf01_merge/static/organisation_0_0.csv'                       (DELIMITER '|', HEADER);


COPY forum_person      FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/forum_hasMember_person_0_0.csv'      (DELIMITER '|', HEADER);

COPY person_islocatedin            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/person_isLocatedIn_place_0_0.csv'                      (DELIMITER '|', HEADER);

COPY person_company            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/person_workAt_organisation_0_0.csv'                      (DELIMITER '|', HEADER);

COPY likes_comment            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/person_likes_comment_0_0.csv'                      (DELIMITER '|', HEADER);

COPY comment_islocatedin            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/comment_isLocatedIn_place_0_0.csv'                      (DELIMITER '|', HEADER);

COPY comment_hascreator            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/comment_hasCreator_person_0_0.csv'                      (DELIMITER '|', HEADER);

COPY comment_replyof_post            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/comment_replyOf_post_0_0.csv'                      (DELIMITER '|', HEADER);

COPY post_hascreator            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/post_hasCreator_person_0_0.csv'                      (DELIMITER '|', HEADER);

COPY post_tag            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/post_hasTag_tag_0_0.csv'                      (DELIMITER '|', HEADER);

COPY containerof_post            FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/forum_containerOf_post_0_0.csv'                      (DELIMITER '|', HEADER);

COPY org_islocatedin            FROM '../../../third_party/planir/resource/graph/sf01_merge/static/organisation_isLocatedIn_place_0_0.csv'                      (DELIMITER '|', HEADER);

COPY tag_hastype            FROM '../../../third_party/planir/resource/graph/sf01_merge/static/tag_hasType_tagclass_0_0.csv'                      (DELIMITER '|', HEADER);

COPY issubclassof            FROM '../../../third_party/planir/resource/graph/sf01_merge/static/tagclass_isSubclassOf_tagclass_0_0.csv'                      (DELIMITER '|', HEADER);

COPY knows (k_person1id, k_person2id, k_creationdate) FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/person_knows_person_0_0.csv' (DELIMITER '|', HEADER);
COPY knows (k_person2id, k_person1id, k_creationdate) FROM '../../../third_party/planir/resource/graph/sf01_merge/dynamic/person_knows_person_0_0.csv' (DELIMITER '|', HEADER);

