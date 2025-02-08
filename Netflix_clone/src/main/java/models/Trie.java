package models;

import java.util.*;

public class Trie {
    private class TrieNode {
        Map<Character, TrieNode> children = new HashMap<>();
        boolean isEndOfWord;
    }

    private final TrieNode root;

    public Trie() {
        root = new TrieNode();
    }

    // Insert a movie title into the Trie
    public void insert(String word) {
        TrieNode current = root;
        for (char ch : word.toLowerCase().toCharArray()) {
            if (!Character.isLetter(ch)) { // Skip non-alphabetic characters
                continue;
            }

            current.children.putIfAbsent(ch, new TrieNode());
            current = current.children.get(ch);
        }
        current.isEndOfWord = true;

        // Debugging: Print words inserted into Trie
        System.out.println("Inserted into Trie: " + word);
    }


    // Search for suggestions based on prefix
    public List<String> search(String prefix) {
        List<String> results = new ArrayList<>();
        TrieNode node = root;
        for (char ch : prefix.toLowerCase().toCharArray()) {
            if (!node.children.containsKey(ch)) {
                return results; // No suggestions found
            }
            node = node.children.get(ch);
        }
        findAllWords(node, prefix, results);
        return results;
    }

    // DFS to collect words from the Trie
    private void findAllWords(TrieNode node, String prefix, List<String> results) {
        if (node.isEndOfWord) {
            results.add(prefix);
        }
        for (char ch : node.children.keySet()) {
            findAllWords(node.children.get(ch), prefix + ch, results);
        }
    }
}
