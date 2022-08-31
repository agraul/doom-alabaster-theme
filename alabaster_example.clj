(ns grumpy.macros)

(defmacro oget [obj key]
  (list 'js* "(~{}[~{}])" obj key))


(defmacro oset! [obj key val]
  (list 'js* "(~{}[~{}] = ~{})" obj key val))

(defmacro js-fn [& body]
  (if (:ns &env) ;; cljs
    `(fn ~@body)
    `nil))

(defmacro cond+ [& clauses]
  (when-some [[test expr & rest] clauses]
    (case test
      :let `(let ~expr (cond+ ~@rest))
      :do `(do ~expr (cond+ ~@rest))
      `(if ~test ~expr (cond+ ~@rest)))))

(ns playground
  (:require
    [clojure.string :as str]))

(defn clojure-function [args]
  (let [string   "multiline\nstring"
        regexp   #"regexp"
        number   100.000
        booleans [false true]
        keyword  ::the-keyword]
    ;; this is comment
    (if true
      (->>
        (list [vector] {:map map} #{'set})))))

;; current line highlight

;; find highlights:
(def some-var)
(defonce another-var)
